"use client";

import { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { cn } from "@/lib/utils";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Button } from "@/components/ui/button";
import { LogOut } from "lucide-react";
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@/components/ui/tooltip";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { useSidebar } from "@/components/ui/sidebar";
import { observer } from "@legendapp/state/react";
import dynamic from "next/dynamic";
import { userStore } from "@/stores/userProvider";
import { supabaseClient } from "@/utils/supabase/client";

function UserNav() {
  const [isLogoutDialogOpen, setIsLogoutDialogOpen] = useState(false);
  const router = useRouter();
  const { state } = useSidebar();
  const user = userStore.user.get();

  const handleLogout = async () => {
    // TODO: Implement actual logout functionality
    console.log("Logging out...");
    setIsLogoutDialogOpen(false);
    // After logout, redirect to login page
    await supabaseClient.auth.signOut();
    //router.push("/auth/get-started");
  };

  if (!user) return null;

  const userInfo = (
    <Link
      href="/dashboard/account"
      className={cn("flex items-center flex-row gap-2")}
    >
      <Avatar className="h-8 w-8 cursor-pointer">
        <AvatarImage
          src={user.user_metadata.avatar_url}
          alt={user.user_metadata.name}
        />
        <AvatarFallback>
          {user.user_metadata.firstName?.charAt(0)}
          {user.user_metadata.lastName?.charAt(0)}
        </AvatarFallback>
      </Avatar>
      <div className="flex flex-col">
        <span className="text-sm font-medium cursor-pointer hover:underline">
          {user.user_metadata.name}
        </span>

        <span className="text-xs truncate text-muted-foreground cursor-pointer hover:underline">
          {user.email}
        </span>
      </div>
    </Link>
  );

  const logoutButton = (
    <Button
      variant="ghost"
      size="icon"
      onClick={() => setIsLogoutDialogOpen(true)}
      className={cn("h-8 w-8", state === "collapsed" ? "" : "")}
    >
      <LogOut className="h-4 w-4" />
      <span className="sr-only">Log out</span>
    </Button>
  );

  return (
    <>
      <div className={cn("flex flex-row justify-between items-center ")}>
        {userInfo}
        {logoutButton}
      </div>

      <Dialog open={isLogoutDialogOpen} onOpenChange={setIsLogoutDialogOpen}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle>Are you sure you want to log out?</DialogTitle>
            <DialogDescription>
              You will be redirected to the login page.
            </DialogDescription>
          </DialogHeader>
          <DialogFooter>
            <Button
              variant="outline"
              onClick={() => setIsLogoutDialogOpen(false)}
            >
              Cancel
            </Button>
            <Button onClick={handleLogout}>Log out</Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </>
  );
}

export default dynamic(() => Promise.resolve(observer(UserNav)), {
  ssr: false,
});
