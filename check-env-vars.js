function verifyEnvVars() {
  const requiredVars = [
    "NEXT_PUBLIC_SUPABASE_URL",
    "NEXT_PUBLIC_SUPABASE_ANON_KEY", 
    "SUPABASE_SERVICE_ROLE_KEY",
    "NEXT_PUBLIC_FRONTEND_URL",
    "SENTRY_AUTH_TOKEN",
    "NEXT_PUBLIC_SENTRY_ENABLED",
    "NEXT_PUBLIC_SUPABASE_TEST_URL",
    "NEXT_PUBLIC_SUPABASE_TEST_ANON_KEY",
    "SUPABASE_SERVICE_ROLE_KEY_TEST",
    "SUPABASE_TEST_DB_URL",
    "SUPABASE_DB_URL",
  ];

  const missingVars = requiredVars.filter((varName) => !process.env[varName]);

  if (missingVars.length > 0) {
    throw new Error(
      `Missing required environment variables: ${missingVars.join(", ")}. ` +
        "Please check your .env.local file or deployment configuration.",
    );
  }
}

module.exports = { verifyEnvVars };
