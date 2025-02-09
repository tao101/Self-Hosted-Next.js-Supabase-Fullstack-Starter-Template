import { test, expect } from '@playwright/test';
import { supabaseAdminTest } from '../utils/supabaseTest';
import { sleep } from '@/utils/utils';

const ADMIN_EMAIL = `role-admin-test-user-${Date.now()}@example.com`;
const USER_EMAIL = `role-user-test-user-${Date.now()}@example.com`;

test.describe.parallel('User Role Access Control', () => {
  let adminUserId: string;
  let regularUserId: string;

  test.beforeEach(async ({ page }) => {});

  test.beforeAll(async ({}) => {
    // Create test users directly in Supabase
    const { data: adminUser } = await supabaseAdminTest.auth.admin.createUser({
      email: ADMIN_EMAIL,
      email_confirm: true,
      password: 'password123',
    });
    adminUserId = adminUser.user!.id;
    console.log('adminUserId ', adminUserId);

    const { data: regularUser } = await supabaseAdminTest.auth.admin.createUser(
      {
        email: USER_EMAIL,
        email_confirm: true,
        password: 'password123',
      }
    );
    regularUserId = regularUser.user!.id;

    // Set admin role
    let result = await supabaseAdminTest
      .from('user_roles')
      .update({ role: 'admin' })
      .eq('user_id', adminUserId);

    console.log('result ', result);

    await sleep(3000);

    let userRole = await supabaseAdminTest
      .from('user_roles')
      .select('role')
      .eq('user_id', adminUserId)
      .limit(1)
      .single();

    console.log('userRole ', userRole);

    expect(userRole.data?.role).toBe('admin');
  });

  test('non-admin should be redirected from /dashboard/admin', async ({
    page,
  }) => {
    const {
      data: { session },
    } = await supabaseAdminTest.auth.signInWithPassword({
      email: USER_EMAIL,
      password: 'password123',
    });

    if (!session) {
      throw new Error('Failed to create session');
    }

    await page.goto('/');

    // Set the auth cookies
    const projectRef = process.env.SUPABASE_TEST_PROJECT_REF;

    if (!projectRef) {
      throw new Error('SUPABASE_TEST_PROJECT_REF is not set');
    }

    await page.context().addCookies([
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

    // Add a small delay to ensure cookies are set
    await page.waitForTimeout(1000);

    // Continue with navigation
    await page.goto('/dashboard');
    await expect(page).toHaveURL(/dashboard/);

    await page.goto('/dashboard/admin');
    await expect(page).toHaveURL(/dashboard/);
  });

  test('admin should access /dashboard/admin', async ({ page }) => {
    // Full UI login flow for admin
    // Full UI login flow

    const {
      data: { session },
    } = await supabaseAdminTest.auth.signInWithPassword({
      email: ADMIN_EMAIL,
      password: 'password123',
    });

    if (!session) {
      throw new Error('Failed to create session');
    }

    await page.goto('/');

    // Set the auth cookies
    const projectRef = process.env.SUPABASE_TEST_PROJECT_REF;

    if (!projectRef) {
      throw new Error('SUPABASE_TEST_PROJECT_REF is not set');
    }

    await page.context().addCookies([
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

    await page.goto('/');

    // Verify dashboard access
    await page.goto('/dashboard');
    await expect(page).toHaveURL(/dashboard/);

    // Verify admin access
    await page.goto('/dashboard/admin');

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
