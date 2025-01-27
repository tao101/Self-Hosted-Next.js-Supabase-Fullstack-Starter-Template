import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { SidebarTrigger } from "@/components/ui/sidebar";

export default function DashboardPage() {
  return (
    <div className="w-full flex-1 p-6 space-y-6 ">
      <div className="flex items-center justify-start">
        <SidebarTrigger />
        <h1 className="text-3xl font-bold">Dashboard</h1>
      </div>
    </div>
  );
}
