"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { observer } from "@legendapp/state/react";
import { userStore } from "@/stores/userProvider";
import dynamic from "next/dynamic";
import { usePathname } from "next/navigation";

interface ActionButtonProps {
  onClick?: () => void;
  className?: string;
  size?: "default" | "sm";
}

export function ActionButton({
  onClick,
  className,
  size = "default",
}: ActionButtonProps) {
  const user = userStore.user.get();
  const pathname = usePathname();

  if (pathname === "/auth/get-started" && !user) {
    return null;
  }

  return (
    <Button
      asChild
      className={`bg-[#34CCFF] hover:bg-[#2AB8E8] ${className}`}
      onClick={onClick}
      size={size}
    >
      <Link href={user ? "/dashboard" : "/auth/get-started"}>
        {user ? "Dashboard" : "Get Started"}
      </Link>
    </Button>
  );
}

export default dynamic(() => Promise.resolve(observer(ActionButton)), {
  ssr: false,
});
