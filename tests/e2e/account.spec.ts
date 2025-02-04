import { test, expect } from '@playwright/test';
import { supabaseAdminTest } from '../utils/supabaseTest';
import { sleep } from '@/utils/utils';
import fs from 'fs/promises';

const TEST_EMAIL = `account-test-user-${Date.now()}@example.com`;
const TEST_PASSWORD = 'test1234!';
let testUserId: string;

test.beforeAll(async ({ browser }) => {
  // Create test user and login once
  const { data: user } = await supabaseAdminTest.auth.admin.createUser({
    email: TEST_EMAIL,
    email_confirm: true,
    user_metadata: {
      firstName: 'Test',
      lastName: 'User',
      receiveMarketingEmails: true,
    },
  });
  testUserId = user?.user?.id!;

  // Perform login once and save storage state
  const page = await browser.newPage();

  await page.goto('/auth/get-started');
  await page.getByLabel('Email').fill(TEST_EMAIL);
  await page.getByRole('button', { name: /Send OTP & Magic Link/i }).click();

  // Get OTP directly from magic link
  const { data } = await supabaseAdminTest.auth.admin.generateLink({
    type: 'magiclink',
    email: TEST_EMAIL,
  });
  const otp = data?.properties?.email_otp;

  await page.getByRole('textbox', { name: /OTP/i }).fill(otp!);
  await page.getByRole('button', { name: /Verify OTP/i }).click();
  await page.waitForURL(/dashboard/);

  // Save session state for all tests
  await page.context().storageState({ path: 'tests/.auth/user.json' });
  await page.close();
});

test.beforeEach(async ({ page }) => {
  // Reuse authenticated state
  await page.goto('/dashboard/account');
});

test('should update profile information', async ({ page }) => {
  const randomName = 'TestName';
  // Update fields
  // Verify and fill first name
  const firstNameInput = page.getByLabel('First Name');
  await firstNameInput.waitFor({ state: 'visible' });
  await firstNameInput.clear();
  await firstNameInput.fill(randomName, { force: true });
  await expect(firstNameInput).toHaveValue(randomName);

  // Verify and fill last name
  const lastNameInput = page.getByLabel('Last Name');
  await lastNameInput.waitFor({ state: 'visible' });
  await lastNameInput.clear();
  await lastNameInput.fill(randomName, { force: true });
  await expect(lastNameInput).toHaveValue(randomName);

  // Submit form
  await page.getByRole('button', { name: 'Update Profile' }).click();

  await sleep(2000);
  // Verify Supabase update
  await expect(async () => {
    const { data } = await supabaseAdminTest.auth.admin.getUserById(testUserId);
    expect(data.user?.user_metadata.firstName).toBe(randomName);
    expect(data.user?.user_metadata.lastName).toBe(randomName);
  }).toPass({ timeout: 30000 });
});

test('should validate profile form inputs', async ({ page }) => {
  // Test required fields
  await page.getByLabel('First Name').fill('');
  await page.getByLabel('Last Name').fill('');
  await page.getByRole('button', { name: 'Update Profile' }).click();

  await expect(
    page.getByText('First name must be at least 1 character.')
  ).toBeVisible();
  await expect(
    page.getByText('Last name must be at least 1 characters.')
  ).toBeVisible();

  // Test email validation
  await page.getByRole('textbox', { name: 'Email' }).fill(`updated`);

  await page.getByRole('button', { name: 'Update Profile' }).click();
  await expect(
    page.getByText('Please enter a valid email address')
  ).toBeVisible();
});

test('should update marketing email preferences', async ({ page }) => {
  const { data: dataBefore } =
    await supabaseAdminTest.auth.admin.getUserById(testUserId);
  let valueBefore = dataBefore.user?.user_metadata.receiveMarketingEmails;
  const switchControl = page.getByRole('switch', {
    name: 'Marketing Emails',
  });

  // Toggle switch
  const initialValue = await switchControl.isChecked();
  await switchControl.click();
  await page.getByRole('button', { name: 'Update Profile' }).click();

  await sleep(5000);

  const { data } = await supabaseAdminTest.auth.admin.getUserById(testUserId);
  let valueAfter = data.user?.user_metadata.receiveMarketingEmails;
  expect(valueAfter).toBe(!valueBefore);
});

test('should reject invalid deletion confirmation', async ({ page }) => {
  await page.getByRole('button', { name: 'Remove My Account' }).click();

  // Fill invalid confirmation
  await page
    .getByLabel(/Type ['"]delete my account['"] to confirm/i)
    .fill('wrong text');
  await page.getByRole('button', { name: 'Delete Account' }).click();

  // Verify error message
  await expect(
    page.getByText("Please type 'delete my account' to confirm.")
  ).toBeVisible();

  // Verify account still exists
  const { data } = await supabaseAdminTest.auth.admin.getUserById(testUserId);
  expect(data.user).not.toBeNull();
});

test('should handle avatar upload', async ({ page }) => {
  // Upload test image
  const fileChooserPromise = page.waitForEvent('filechooser');
  const fileInput = page.locator('input[type="file"][accept="image/*"]');
  await expect(fileInput).toBeVisible();
  await fileInput.click();
  const fileChooser = await fileChooserPromise;
  await fileChooser.setFiles('./tests/fixtures/profile.png');

  await sleep(5000);

  // Verify Supabase update
  const { data } = await supabaseAdminTest.auth.admin.getUserById(testUserId);
  expect(data.user?.user_metadata.avatar_url).toContain('user_avatars');
});

test('should delete account', async ({ page }) => {
  await page.getByRole('button', { name: 'Remove My Account' }).click();

  // Fill confirmation dialog
  await page
    .getByLabel(/Type ['"]delete my account['"] to confirm/i)
    .fill('delete my account');
  await page.getByRole('button', { name: 'Delete Account' }).click();

  await page.waitForTimeout(3000);

  await page.goto('/dashboard/account');

  // Verify deletion and redirect
  await expect(page).toHaveURL(/auth\/get-started/);

  // Verify user deleted in Supabase
  const { data } = await supabaseAdminTest.auth.admin.getUserById(testUserId);
  expect(data.user).toBeNull();
});

test.afterAll(async () => {
  // Cleanup user
  await supabaseAdminTest.auth.admin.deleteUser(testUserId);
  // Clear auth state
  try {
    await fs.rm('tests/.auth', { recursive: true });
  } catch {}
});
