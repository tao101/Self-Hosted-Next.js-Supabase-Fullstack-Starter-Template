import DashboardSidebar from "@/components/dashboard/sidebar";
import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar";
import createServerSupabaseClient from "@/utils/supabase/server";
import { cookies } from "next/headers";
import { redirect } from "next/navigation";

export default async function ProtectedLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const cookieStore = await cookies();
  const defaultOpen = cookieStore.get("sidebar:state")?.value === "true";

  const supabase = await createServerSupabaseClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect("/auth/get-started");
  }

  return (
    <SidebarProvider defaultOpen={defaultOpen}>
      <div className="flex-1 flex h-screen overflow-hidden">
        <DashboardSidebar />
        <main className="w-full flex-1  overflow-y-auto bg-background transition-all duration-300 ease-in-out">
          {children}
        </main>
      </div>
    </SidebarProvider>
  );
}
