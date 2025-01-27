"use client";
import { userStore } from "@/stores/userProvider";
import { observer } from "@legendapp/state/react";
import dynamic from "next/dynamic";

export function PrintUser() {
  const user = userStore.user.get();
  const role = userStore.role.get();

  return (
    <div>
      <p>Role: {role}</p>
      {user && <pre>{JSON.stringify(user, null, 2)}</pre>}
      {!user && <p>No user</p>}
    </div>
  );
}

export default dynamic(() => Promise.resolve(observer(PrintUser)), {
  ssr: false,
});
