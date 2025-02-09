import { test, expect } from '@playwright/test';
import { supabaseAdminTest } from '../utils/supabaseTest';
import { sleep } from '@/utils/utils';

export const TEST_EMAIL = `auth-test-user-${Date.now()}@example.com`;
const TEST_FIRST_NAME = 'Test';
const TEST_LAST_NAME = 'User';

test.beforeEach(async ({ page }) => {
  await page.goto('/');
});

let testUserId: string; // Shared variable for the describe block

test.describe.serial('Authentication Flow', () => {
  test('should allow user to sign up with OTP', async ({ page }) => {
    await page.goto('/auth/get-started');
    // Switch to sign up form
    await page.getByRole('button', { name: /Sign Up/i }).click();

    // Fill registration form
    await page.getByLabel('Email').fill(TEST_EMAIL);
    await page.getByLabel('First Name').fill(TEST_FIRST_NAME);
    await page.getByLabel('Last Name').fill(TEST_LAST_NAME);
    await page.getByRole('button', { name: /Register/i }).click();

    // Wait for OTP verification form
    await expect(
      page.getByText(/Enter the 6-digit OTP sent to/i)
    ).toBeVisible();

    // Get OTP from Supabase
    const { data } = await supabaseAdminTest.auth.admin.generateLink({
      type: 'magiclink',
      email: TEST_EMAIL,
    });
    const otp = data?.properties?.email_otp;

    let user = data?.user;

    if (!otp) {
      throw new Error('Could not retrieve OTP from Supabase');
    }

    if (user) {
      testUserId = user.id;
    } else {
      throw new Error('User creation failed');
    }

    // Fill OTP
    const otpInput = page.getByRole('textbox', { name: /OTP/i });
    await otpInput.fill(otp);
    await page.getByRole('button', { name: /Verify OTP/i }).click();

    // Verify successful registration
    await expect(page.getByText(/Verification successful/i)).toBeVisible();

    // Check user in Supabase
    const { data: userData } =
      await supabaseAdminTest.auth.admin.getUserById(testUserId);
    expect(userData.user?.email).toBe(TEST_EMAIL);
    expect(userData.user?.user_metadata.firstName).toBe(TEST_FIRST_NAME);
    expect(userData.user?.user_metadata.lastName).toBe(TEST_LAST_NAME);
  });

  test('should allow existing user to log in with OTP', async ({ page }) => {
    // Wait 60 seconds to ensure OTP expiry
    await page.waitForTimeout(60000);

    await page.goto('/auth/get-started');

    // Fill email form
    await page.getByLabel('Email').fill(TEST_EMAIL);
    await page.getByRole('button', { name: /Send OTP & Magic Link/i }).click();

    //await page.waitForSelector(':text-matches("6-digit", "i")');

    // Wait for OTP verification form
    await expect(page.getByText(/Enter the 6-digit OTP/i)).toBeVisible();

    // Get OTP from Supabase
    const { data } = await supabaseAdminTest.auth.admin.generateLink({
      type: 'magiclink',
      email: TEST_EMAIL,
    });
    const otp = data?.properties?.email_otp;

    let user = data?.user;

    if (!otp) {
      throw new Error('Could not retrieve OTP from Supabase');
    }

    if (!user) {
      throw new Error('Could not retrieve user from Supabase');
    }

    // Fill OTP
    const otpInput = page.getByRole('textbox', { name: /OTP/i });
    await otpInput.fill(otp);
    await page.getByRole('button', { name: /Verify OTP/i }).click();

    // Verify successful login
    await expect(page.getByText(/Authentication successful/i)).toBeVisible();
    await sleep(2000);
    // Check user session
    await expect(page).toHaveURL(/dashboard/);

    await page.goto('/auth/get-started');
    await expect(page).toHaveURL(/dashboard/);

    await page.goto('/dashboard/account');

    await expect(page.getByText(new RegExp(TEST_EMAIL, 'i'))).toBeTruthy();
  });

  test.afterAll(async () => {
    if (testUserId) {
      await supabaseAdminTest.auth.admin.deleteUser(testUserId);
    }
  });
});

test.describe.parallel('Auth Form Validation', () => {
  let testUserId: string;

  test('should reject invalid OTP attempts', async ({ page }) => {
    await page.goto('/auth/get-started');

    await page.getByRole('button', { name: /Sign Up/i }).click();

    await page.getByLabel('First Name').fill(TEST_FIRST_NAME);
    await page.getByLabel('Last Name').fill(TEST_LAST_NAME);

    // Fill email form
    await page.getByLabel('Email').fill(TEST_EMAIL);
    await page.getByRole('button', { name: /Register/i }).click();

    // Wait for OTP verification form
    await expect(
      page.getByText(/Enter the 6-digit OTP sent to/i)
    ).toBeVisible();

    // Wait for OTP verification form
    //await page.waitForSelector(':text-matches("6-digit", "i")');

    // Get valid OTP from Supabase but modify it
    const { data } = await supabaseAdminTest.auth.admin.generateLink({
      type: 'magiclink',
      email: TEST_EMAIL,
    });
    const validOtp = data?.properties?.email_otp;
    testUserId = data?.user?.id!;
    if (!validOtp) {
      throw new Error('Could not retrieve OTP from Supabase');
    }
    const invalidOtp =
      validOtp.slice(0, -1) + String((Number(validOtp.slice(-1)) + 1) % 10);

    // Fill invalid OTP
    const otpInput = page.getByRole('textbox', { name: /OTP/i });
    await otpInput.fill(invalidOtp);

    await page.getByRole('button', { name: /Verify OTP/i }).click();

    // Verify error message
    await expect(
      page.getByText(/Token has expired or is invalid/i)
    ).toBeVisible();

    // Verify not logged in
    await page.goto('/dashboard/account');
    await expect(page).toHaveURL(/auth\/get-started/);

    //delete test user
    await supabaseAdminTest.auth.admin.deleteUser(testUserId);
  });

  test('should redirect unauthorized users to auth page', async ({ page }) => {
    // Try to access protected page directly
    await page.goto('/dashboard');
    // Verify redirection to auth page
    await expect(page).toHaveURL(/auth\/get-started/);
  });

  test('should validate email format on signup', async ({ page }) => {
    await page.goto('/auth/get-started');
    await page.getByRole('button', { name: /Sign Up/i }).click();

    // Test invalid email patterns
    const invalidEmails = [
      'missing@domain',
      'noatsign.com',
      'invalid@domain.c',
      ' spac e@domain.com',
      'space@domain .com ',
      'space@domain.com.',
      'space@domain.com..',
    ];

    for (const email of invalidEmails) {
      await page.getByLabel('Email').fill(email);
      await page.getByLabel('First Name').fill('Test');
      await page.getByLabel('Last Name').fill('User');
      await page.getByRole('button', { name: /Register/i }).click();

      await page.waitForSelector(':text("invalid email address")');

      await expect(page.getByText(/invalid email address/i)).toBeVisible();
    }
  });

  test('should validate required fields on signup', async ({ page }) => {
    await page.goto('/auth/get-started');
    await page.getByRole('button', { name: /Sign Up/i }).click();

    // Test empty form submission
    await page.getByRole('button', { name: /Register/i }).click();
    await expect(page.getByText(/Invalid email address/i)).toBeVisible();
    await expect(page.getByText(/First name is required/i)).toBeVisible();
    await expect(page.getByText(/Last name is required/i)).toBeVisible();

    // Test whitespace inputs
    await page.getByLabel('First Name').fill('   ');
    await page.getByLabel('Last Name').fill('   ');
    await page.getByRole('button', { name: /Register/i }).click();
    await expect(page.getByText(/First name is required/i)).toBeVisible();
    await expect(page.getByText(/Last name is required/i)).toBeVisible();
  });

  test('should validate name field lengths', async ({ page }) => {
    await page.goto('/auth/get-started');
    await page.getByRole('button', { name: /Sign Up/i }).click();

    // Test long names
    const longName = 'A'.repeat(51);
    await page.getByLabel('First Name').fill(longName);
    await page.getByLabel('Last Name').fill(longName);
    await page.getByRole('button', { name: /Register/i }).click();
    await expect(page.getByText(/First name too long/i)).toBeVisible();
    await expect(page.getByText(/Last name too long/i)).toBeVisible();
  });

  test('should normalize email case and whitespace', async ({ page }) => {
    const testEmail = `  ${TEST_EMAIL.toUpperCase()}  `;

    // Sign Up
    await page.goto('/auth/get-started');
    await page.getByRole('button', { name: /Sign Up/i }).click();
    await page.getByLabel('Email').fill(testEmail);
    await page.getByLabel('First Name').fill(TEST_FIRST_NAME);
    await page.getByLabel('Last Name').fill(TEST_LAST_NAME);
    await page.getByRole('button', { name: /Register/i }).click();

    // Check normalized email in verification message
    await expect(page.getByText(new RegExp(TEST_EMAIL, 'i'))).toBeVisible();

    //get user otp to get thier id
    const { data } = await supabaseAdminTest.auth.admin.generateLink({
      type: 'magiclink',
      email: TEST_EMAIL,
    });
    const otp = data?.properties?.email_otp;
    testUserId = data?.user?.id!;

    //delete test user
    await supabaseAdminTest.auth.admin.deleteUser(testUserId);
  });

  test.afterAll(async () => {
    if (testUserId) {
      await supabaseAdminTest.auth.admin.deleteUser(testUserId);
    }
  });
});
