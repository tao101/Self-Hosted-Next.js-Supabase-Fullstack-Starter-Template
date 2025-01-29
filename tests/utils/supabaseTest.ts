import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL || !SERVICE_ROLE_KEY) {
  throw new Error(`
    Missing Supabase environment variables for tests.
    Check your .env file and make sure:
    - NEXT_PUBLIC_SUPABASE_URL is set
    - SUPABASE_SERVICE_ROLE_KEY is set
  `);
}

export const supabaseAdminTest = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!
);
