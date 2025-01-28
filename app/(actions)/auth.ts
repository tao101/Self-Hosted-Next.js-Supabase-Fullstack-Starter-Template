'use server';

import 'server-only';

import createServerSupabaseClient from '@/utils/supabase/server';
import { redirect } from 'next/navigation';
import supabaseAdmin from '@/utils/supabase/supabaseAdmin';

export async function signOut() {
  const supabase = await createServerSupabaseClient();
  await supabase.auth.signOut();
  redirect('/');
}

export async function getUserRole() {
  const supabase = await createServerSupabaseClient();
  const { data, error } = await supabase
    .from('user_roles')
    .select()
    .limit(1)
    .single();

  if (error || !data) {
    return undefined;
  }
  return data.role ?? undefined;
}

export async function deleteUserAccount() {
  try {
    const supabase = await createServerSupabaseClient();

    let { data: currentUser, error: currentUserError } =
      await supabase.auth.getUser();
    if (currentUserError || !currentUser.user) {
      throw new Error('User not found');
    }

    let userId = currentUser.user.id;

    let { data, error } = await supabaseAdmin.auth.admin.deleteUser(userId);
    console.log('deleteUserAccount data', data);
    console.log('deleteUserAccount error', error);

    if (error) {
      throw error;
    }

    return {
      data: 'User deleted',
      error: undefined,
    };
  } catch (error) {
    console.error('Error deleting user account:', error);
    return {
      data: undefined,
      error: error,
    };
  }
}
