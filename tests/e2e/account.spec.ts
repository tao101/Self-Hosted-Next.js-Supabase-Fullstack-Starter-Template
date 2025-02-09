import { test as base, expect } from '@playwright/test';
import { supabaseAdminTest } from '../utils/supabaseTest';
import fs from 'fs/promises';
import path from 'path';

const TEST_EMAIL = `account-test-user-${Date.now()}@example.com`;
const TEST_PASSWORD = 'test1234!';
let testUserId: string;

// Create a test fixture that doesn't use storage state
const test = base.extend({});

test.beforeAll(async ({ browser }) => {
  // Ensure auth directory exists
  const authDir = path.join(process.cwd(), 'tests', '.auth');
  await fs.mkdir(authDir, { recursive: true });

  // Create test user and login once
  const { data: user } = await supabaseAdminTest.auth.admin.createUser({
    email: TEST_EMAIL,
    email_confirm: true,
    password: TEST_PASSWORD,
    user_metadata: {
      firstName: 'Test',
      lastName: 'User',
      receiveMarketingEmails: true,
    },
  });
  testUserId = user?.user?.id!;

  // Create a new context
  const context = await browser.newContext();
  const page = await context.newPage();

  const {
    data: { session },
  } = await supabaseAdminTest.auth.signInWithPassword({
    email: TEST_EMAIL,
    password: TEST_PASSWORD,
  });

  if (!session) {
    throw new Error('Failed to create session');
  }

  // Set the auth cookies
  const projectRef = process.env.SUPABASE_TEST_PROJECT_REF;
  if (!projectRef) {
    throw new Error('SUPABASE_TEST_PROJECT_REF is not set');
  }

  await context.addCookies([
    {
      name: `sb-${projectRef}-auth-token`,
      value: JSON.stringify({
        access_token: session.access_token,
        refresh_token: session.refresh_token,
        expires_in: session.expires_in,
        expires_at: session.expires_at,
        token_type: 'bearer',
        user: session.user,
      }),
      domain: 'localhost',
      path: '/',
    },
  ]);

  // Navigate to ensure cookies are set
  await page.goto('/dashboard');
  await page.waitForURL(/dashboard/);

  // Save storage state
  const authFile = path.join(authDir, 'user.json');
  await context.storageState({ path: authFile });

  // Verify storage state was created
  try {
    await fs.access(authFile);
  } catch {
    throw new Error('Failed to create storage state file');
  }

  // Close the initial context
  await page.close();
  await context.close();
});

// Define authenticated test with error handling
const authenticatedTest = base.extend({
  page: async ({ browser }, use) => {
    const authFile = path.join(process.cwd(), 'tests', '.auth', 'user.json');

    // Verify storage state exists
    try {
      await fs.access(authFile);
    } catch {
      throw new Error(
        'Storage state file not found. Did beforeAll run successfully?'
      );
    }

    const context = await browser.newContext({
      storageState: authFile,
    });
    const page = await context.newPage();
    await use(page);
    await context.close();
  },
});

// Use the authenticated test for all test cases
authenticatedTest.beforeEach(async ({ page }) => {
  await page.goto('/dashboard/account');
});

authenticatedTest.describe('Account tests', () => {
  authenticatedTest('should update profile information', async ({ page }) => {
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

    await page.waitForTimeout(5000);
    // Verify Supabase update
    await expect(async () => {
      const { data } =
        await supabaseAdminTest.auth.admin.getUserById(testUserId);
      expect(data.user?.user_metadata.firstName).toBe(randomName);
      expect(data.user?.user_metadata.lastName).toBe(randomName);
    }).toPass({ timeout: 30000 });
  });

  authenticatedTest('should validate profile form inputs', async ({ page }) => {
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

  authenticatedTest(
    'should update marketing email preferences',
    async ({ page }) => {
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

      await page.waitForTimeout(2000);

      const { data } =
        await supabaseAdminTest.auth.admin.getUserById(testUserId);
      let valueAfter = data.user?.user_metadata.receiveMarketingEmails;
      expect(valueAfter).toBe(!valueBefore);
    }
  );

  authenticatedTest(
    'should reject invalid deletion confirmation',
    async ({ page }) => {
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
      const { data } =
        await supabaseAdminTest.auth.admin.getUserById(testUserId);
      expect(data.user).not.toBeNull();
    }
  );

  authenticatedTest('should handle avatar upload', async ({ page }) => {
    // Upload test image
    const fileChooserPromise = page.waitForEvent('filechooser');
    const fileInput = page.locator('input[type="file"][accept="image/*"]');
    await expect(fileInput).toBeVisible();
    await fileInput.click();
    const fileChooser = await fileChooserPromise;
    await fileChooser.setFiles('./tests/fixtures/profile.png');

    await page.waitForTimeout(5000);

    // Verify Supabase update
    const { data } = await supabaseAdminTest.auth.admin.getUserById(testUserId);
    expect(data.user?.user_metadata.avatar_url).toContain('user_avatars');
  });
});

authenticatedTest.describe.configure({ mode: 'serial' });

authenticatedTest('should delete account', async ({ page }) => {
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

authenticatedTest.afterAll(async () => {
  // Cleanup user
  await supabaseAdminTest.auth.admin.deleteUser(testUserId);
  // Clear auth state
  try {
    await fs.rm('tests/.auth', { recursive: true });
  } catch {}
});
