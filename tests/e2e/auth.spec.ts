import { test, expect } from "@playwright/test";

test("should complete auth flow", async ({ page }) => {
  // Test signup flow
  await page.goto("/auth/get-started");
  await page.getByLabel("Email").fill("test@example.com");
  await page.getByRole("button", { name: "Continue" }).click();

  // Verify redirect to dashboard after auth
  await expect(page).toHaveURL("/dashboard");

  // Test protected route access
  await page.goto("/dashboard/settings");
  await expect(page.getByText("Account Settings")).toBeVisible();

  // Test sign out
  await page.getByRole("button", { name: "Sign Out" }).click();
  await expect(page).toHaveURL("/auth/get-started");
});
