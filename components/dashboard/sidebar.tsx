"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import { ScrollArea } from "@/components/ui/scroll-area";
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarHeader,
  SidebarTrigger,
  useSidebar,
} from "@/components/ui/sidebar";
import {
  Mail,
  LayoutDashboard,
  UserCheck,
  Search,
  Users,
  Code,
  MessageSquare,
  PanelLeftClose,
  PanelLeftOpen,
  Shield,
  Building,
  UserSearch,
  MailCheck,
  Workflow,
} from "lucide-react";
import UserNav from "./userNav";
import Logo from "../logo";
import { userStore } from "@/stores/userProvider";
import { observer } from "@legendapp/state/react";

function DashboardSidebar() {
  const pathname = usePathname();
  const { state, toggleSidebar } = useSidebar();
  const role = userStore.role.get();

  const sidebarItems = [
    {
      name: "Admin dashboard",
      href: "/dashboard/admin",
      icon: Shield,
      hidden: role != "admin",
      paths: ["/dashboard/admin"],
    },
    {
      name: "Dashboard",
      href: "/dashboard",
      icon: LayoutDashboard,
      hidden: false,
      paths: ["/dashboard"],
    },
    {
      name: "Account",
      href: "/dashboard/account",
      icon: UserCheck,
      hidden: false,
      paths: [
        "/dashboard/account",
        "/dashboard/account/subscription",
        "/dashboard/account/billing",
      ],
    },
    {
      name: "Contact Us",
      href: "/dashboard/contact",
      icon: MessageSquare,
      hidden: false,
      paths: ["/dashboard/contact"],
    },
  ];

  const visibleItems = sidebarItems.filter((item) => !item.hidden);

  console.log("pathname ", pathname);

  return (
    <Sidebar className="border-r border-border" collapsible="icon">
      <SidebarHeader className="border-b px-3 py-4">
        <div className="flex items-center justify-between">
          <Link href="/" className="flex items-center space-x-2">
            {state === "collapsed" ? <Logo /> : <Logo />}
          </Link>
        </div>
      </SidebarHeader>
      <SidebarContent>
        <ScrollArea className="h-[calc(100vh-10rem)] px-3">
          <div className="space-y-1 py-2 flex flex-col">
            {visibleItems.map((item) => (
              <Button
                key={item.href}
                asChild
                variant={item.paths.includes(pathname) ? "secondary" : "ghost"}
                className={cn("w-full h-12 p-2 justify-start")}
              >
                <Link href={item.href} className={cn("flex items-center")}>
                  <item.icon
                    className={cn("h-5 w-5", state !== "collapsed" && "mr-2")}
                  />
                  <span className="">{item.name}</span>
                </Link>
              </Button>
            ))}
          </div>
        </ScrollArea>
      </SidebarContent>
      <SidebarFooter
        className={cn("border-t", state === "collapsed" ? "px-2 py-3" : "p-3")}
      >
        <UserNav />
      </SidebarFooter>
    </Sidebar>
  );
}

export default observer(DashboardSidebar);
