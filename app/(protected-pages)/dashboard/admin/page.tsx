import PrintUser from "@/components/printUser";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { SidebarTrigger } from "@/components/ui/sidebar";

export default function AdminPage() {
  return (
    <div className="p-6 space-y-6 w-full">
      <div className="flex items-center justify-start">
        <SidebarTrigger />
        <h1 className="text-3xl font-bold">Admin</h1>
      </div>
      <Card className="w-full">
        <CardHeader>
          <CardTitle>Admin Settings</CardTitle>
        </CardHeader>
        <CardContent>
          <PrintUser />
          {/* Add account settings form here */}
        </CardContent>
      </Card>
    </div>
  );
}
