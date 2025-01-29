import { test, expect } from '@playwright/test';
import { supabaseAdminTest } from '../utils/supabaseTest';
import { sleep } from '@/utils/utils';

const TEST_EMAIL = `auth-test-user-${Date.now()}@example.com`;
const TEST_FIRST_NAME = 'Test';
const TEST_LAST_NAME = 'User';

test.beforeEach(async ({ page }) => {
  await page.goto('/');
});

test.describe.serial('Authentication Flow', () => {
  let testUserId: string; // Shared variable for the describe block

  test('should redirect unauthorized users to auth page', async ({ page }) => {
    // Try to access protected page directly
    await page.goto('/dashboard');
    // Verify redirection to auth page
    await expect(page).toHaveURL(/auth\/get-started/);
  });

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
      test.fail(true, 'Could not retrieve OTP from Supabase');
      return;
    }

    if (user) {
      testUserId = user.id;
    } else {
      test.fail(true, 'User creation failed');
      return;
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
    await page.goto('/auth/get-started');
    // Fill email form
    await page.getByLabel('Email').fill(TEST_EMAIL);
    await page.getByRole('button', { name: /Send OTP & Magic Link/i }).click();

    await page.waitForSelector(':text("Enter the 6-digit OTP")', {
      timeout: 5000,
    });

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
      test.fail(true, 'Could not retrieve OTP from Supabase');
      return;
    }

    if (!user) {
      test.fail(true, 'Could not retrieve user from Supabase');
      return;
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

    await expect(page.getByText(TEST_EMAIL)).toBeVisible();
  });

  test('should allow existing user to log in with magic link', async ({
    page,
  }) => {
    await page.goto('/auth/get-started');
    // Fill email form
    await page.getByLabel('Email').fill(TEST_EMAIL);
    await page.getByRole('button', { name: /Send OTP & Magic Link/i }).click();

    // Get magic link from Supabase
    const { data } = await supabaseAdminTest.auth.admin.generateLink({
      type: 'magiclink',
      email: TEST_EMAIL,
    });
    const magicLink = data?.properties?.action_link;

    if (!magicLink) {
      test.fail(true, 'Could not retrieve magic link from Supabase');
      return;
    }

    // Navigate directly to magic link URL
    await page.goto(magicLink);

    // Verify successful login
    await expect(page).toHaveURL(/dashboard/);
    await page.goto('/dashboard/account');
    await expect(page.getByText(TEST_EMAIL)).toBeVisible();
  });

  test.afterAll(async () => {
    if (testUserId) {
      const { error } =
        await supabaseAdminTest.auth.admin.deleteUser(testUserId);
      if (error) console.error('Cleanup error:', error);
    }
  });
});
