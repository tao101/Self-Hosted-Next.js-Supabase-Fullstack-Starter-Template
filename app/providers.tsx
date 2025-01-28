'use client';

import { userStore } from '@/stores/userProvider';
import { supabaseClient } from '@/utils/supabase/client';
import { usePathname, useRouter } from 'next/navigation';
import { useEffect } from 'react';
import { getUserRole } from './(actions)/auth';

export function Providers({ children }: { children: React.ReactNode }) {
  const router = useRouter();
  const pathname = usePathname();

  const updateUserRole = async () => {
    let role = await getUserRole();
    userStore.role.set(role);
    console.log('role ', role);
  };

  useEffect(() => {
    // Store the subscription to clean it up later
    const {
      data: { subscription },
    } = supabaseClient.auth.onAuthStateChange(async (event, session) => {
      console.log('event', event);
      console.log('session', session);
      userStore.user.set(session?.user ?? undefined);

      if (event === 'SIGNED_OUT') {
        router.push('/auth/get-started');
        userStore.role.set(undefined);
        userStore.user.set(undefined);
      } else if (event === 'SIGNED_IN') {
        if (pathname === '/auth/get-started') {
          router.push('/dashboard');
        }
      }

      updateUserRole();
    });

    const roleSubscription = supabaseClient
      .channel('user_roles_changes')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'user_roles',
        },
        (payload: { new: { [key: string]: any } }) => {
          console.log('Role change received', payload);
          let newRole = payload.new?.role ?? undefined;
          userStore.role.set(newRole);
        }
      )
      .subscribe();

    // Cleanup function to remove the listener
    return () => {
      subscription.unsubscribe();
      roleSubscription.unsubscribe();
    };
  }, [pathname]);

  return <>{children}</>;
}
