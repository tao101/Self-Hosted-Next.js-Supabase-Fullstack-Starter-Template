"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";

const tabs = [
  { name: "Profile", href: "/dashboard/account" },
  { name: "Billing", href: "/dashboard/account/billing" },
  { name: "Subscription", href: "/dashboard/account/subscription" },
];

export default function AccountTabs() {
  const pathname = usePathname();

  return (
    <Tabs value={pathname} className="space-y-4">
      <TabsList>
        {tabs.map((tab) => (
          <TabsTrigger key={tab.href} value={tab.href} asChild>
            <Link href={tab.href}>{tab.name}</Link>
          </TabsTrigger>
        ))}
      </TabsList>
    </Tabs>
  );
}
