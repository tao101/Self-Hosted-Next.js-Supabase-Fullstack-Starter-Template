import AccountTabs from "@/components/account/accountTabs";
import { SidebarTrigger } from "@/components/ui/sidebar";
import { Metadata } from "next";

export default function AccountLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="w-full flex-1 p-6 space-y-6 ">
      <div className="flex items-center justify-start ">
        <SidebarTrigger />
        <h1 className="text-3xl font-bold ">Account Settings</h1>
      </div>

      <AccountTabs />
      <div className="mt-6">{children}</div>
    </div>
  );
}
