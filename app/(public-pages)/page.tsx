import Logo from "@/components/logo";
import { PrintUser } from "@/components/printUser";
import createServerSupabaseClient from "@/utils/supabase/server";

const signOut = async () => {
  "use server";
  const supabase = await createServerSupabaseClient();
  await supabase.auth.signOut();
};

export default async function HomePage() {
  const supabase = await createServerSupabaseClient();
  const { data: user, error } = await supabase.auth.getUser();
  return (
    <main className="w-full flex-1 flex bg-red-300 flex-col gap-6 px-4">
      <p className="font-medium text-xl mb-4">Home page</p>
      <Logo />
      <p>{JSON.stringify(user)}</p>
      <button onClick={signOut}>Sign out</button>
      <PrintUser />
    </main>
  );
}
