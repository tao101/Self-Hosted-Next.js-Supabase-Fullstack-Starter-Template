import { Database } from "@/types/supabaseTypes";
import { supabaseClient } from "@/utils/supabase/client";
import { observable } from "@legendapp/state";
import { User } from "@supabase/supabase-js";

export type userProvider = {
  user: User | undefined;
  role: Database["public"]["Enums"]["app_role"] | undefined;
};

export const userStore = observable<userProvider>({
  user: undefined,
  role: undefined,
});
