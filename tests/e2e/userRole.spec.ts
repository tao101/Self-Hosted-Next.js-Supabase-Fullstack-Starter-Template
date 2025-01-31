import { test, expect } from '@playwright/test';
import { supabaseAdminTest } from '../utils/supabaseTest';
import { sleep } from '@/utils/utils';

const ADMIN_EMAIL = `role-admin-test-user-${Date.now()}@example.com`;
const USER_EMAIL = `role-user-test-user-${Date.now()}@example.com`;

test.describe.parallel('User Role Access Control', () => {
  let adminUserId: string;
  let regularUserId: string;

  test.beforeEach(async ({ page }) => {
    await page.waitForTimeout(2000); // 2 second delay between tests
  });

  test.beforeAll(async () => {
    // Create test users directly in Supabase
    const { data: adminUser } = await supabaseAdminTest.auth.admin.createUser({
      email: ADMIN_EMAIL,
      email_confirm: true,
    });
    adminUserId = adminUser.user!.id;

    const { data: regularUser } = await supabaseAdminTest.auth.admin.createUser(
      {
        email: USER_EMAIL,
        email_confirm: true,
      }
    );
    regularUserId = regularUser.user!.id;

    // Set admin role
    await supabaseAdminTest
      .from('user_roles')
      .update({ role: 'admin' })
      .eq('user_id', adminUserId);
  });

  test('non-admin should be redirected from /dashboard/admin', async ({
    page,
  }) => {
    // Full UI login flow
    await page.goto('/auth/get-started');
    await page.getByLabel('Email').fill(USER_EMAIL);
    await page.getByRole('button', { name: /Send OTP & Magic Link/i }).click();
    //await page.waitForSelector(':text-matches("6-digit", "i")');

    // Wait for OTP verification form
    await expect(page.getByText(/Enter the 6-digit OTP/i)).toBeVisible();

    // Get OTP from Supabase
    const { data } = await supabaseAdminTest.auth.admin.generateLink({
      type: 'magiclink',
      email: USER_EMAIL,
    });
    const otp = data.properties?.email_otp;

    // Submit OTP
    const otpInput = page.getByRole('textbox', { name: /OTP/i });
    await otpInput.fill(otp!);
    await page.getByRole('button', { name: /Verify OTP/i }).click();

    await expect(page.getByText(/Authentication successful/i)).toBeVisible();
    await sleep(2000);
    // Verify dashboard access
    await expect(page).toHaveURL(/dashboard/);

    // Attempt admin access
    await page.goto('/dashboard/admin');
    await sleep(2000);

    await expect(page).toHaveURL(/dashboard/); // Should redirect back
  });

  test('admin should access /dashboard/admin', async ({ page }) => {
    // Full UI login flow for admin
    // Full UI login flow
    await page.goto('/auth/get-started');
    await page.getByLabel('Email').fill(ADMIN_EMAIL);
    await page.getByRole('button', { name: /Send OTP & Magic Link/i }).click();
    //await page.waitForSelector(':text-matches("6-digit", "i")');

    // Wait for OTP verification form
    await expect(page.getByText(/Enter the 6-digit OTP/i)).toBeVisible();

    // Get OTP from Supabase
    const { data } = await supabaseAdminTest.auth.admin.generateLink({
      type: 'magiclink',
      email: ADMIN_EMAIL,
    });
    const otp = data.properties?.email_otp;

    // Submit OTP
    const otpInput = page.getByRole('textbox', { name: /OTP/i });
    await otpInput.fill(otp!);
    await page.getByRole('button', { name: /Verify OTP/i }).click();

    await expect(page.getByText(/Authentication successful/i)).toBeVisible();
    await sleep(2000);
    // Verify dashboard access
    await expect(page).toHaveURL(/dashboard/);

    // Verify admin access
    await page.goto('/dashboard/admin');
    await sleep(2000);

    await expect(page).toHaveURL(/dashboard\/admin/);
    await expect(
      page.getByRole('heading', { name: 'Admin Dashboard' })
    ).toBeVisible();
  });

  test.afterAll(async () => {
    await supabaseAdminTest.auth.admin.deleteUser(adminUserId);
    await supabaseAdminTest.auth.admin.deleteUser(regularUserId);
  });
});
