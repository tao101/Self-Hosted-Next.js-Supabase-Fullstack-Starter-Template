import createServerSupabaseClient from '@/utils/supabase/server';
import { NextResponse } from 'next/server';
// The client you created from the Server-Side Auth instructions

export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url);
  try {
    // if "next" is in param, use it as the redirect URL
    //const next = searchParams.get('next');

    const code = searchParams.get('code');
    const token = searchParams.get('token');
    const type = searchParams.get('type');
    console.log('code', code);
    console.log('token', token);
    console.log('type', type);

    if (code) {
      const supabase = await createServerSupabaseClient();
      const { error } = await supabase.auth.exchangeCodeForSession(code);
      if (!error) {
        const forwardedHost = request.headers.get('x-forwarded-host'); // original origin before load balancer
        const isLocalEnv = process.env.NODE_ENV === 'development';
        if (isLocalEnv) {
          // we can be sure that there is no load balancer in between, so no need to watch for X-Forwarded-Host
          return NextResponse.redirect(`${origin}`);
        } else if (forwardedHost) {
          return NextResponse.redirect(
            `https://${process.env.NEXT_PUBLIC_FRONTEND_URL}/dashboard`
          );
        } else {
          return NextResponse.redirect(
            `${process.env.NEXT_PUBLIC_FRONTEND_URL}/dashboard`
          );
        }
      } else {
        console.error('Error details:', {
          code: error.code,
          message: error.message,
          status: error.status,
        });

        console.log('Error exchanging code for session:', error);
        return NextResponse.redirect(
          `${process.env.NEXT_PUBLIC_FRONTEND_URL}/auth/auth-code-error`
        );
      }
    } else if (token && type === 'magiclink') {
      const supabase = await createServerSupabaseClient();

      let email = searchParams.get('email');
      if (!email) {
        const {
          data: { user },
        } = await supabase.auth.getUser();
        email = user?.email || null;
      }

      if (!email) {
        console.error('Email not found');
        throw new Error('Email not found');
      }

      const { error } = await supabase.auth.verifyOtp({
        type: 'magiclink',
        token: token,
        email: email,
      });
      if (!error) {
        console.log('Magic link authentication successful');
        return NextResponse.redirect(
          `${process.env.NEXT_PUBLIC_FRONTEND_URL}/dashboard`
        );
      } else {
        console.error('Magic link authentication failed');
        console.error('Error details:', {
          code: error.code,
          message: error.message,
          status: error.status,
        });
        console.log('Error verifying OTP:', error);
        return NextResponse.redirect(
          `${process.env.NEXT_PUBLIC_FRONTEND_URL}/auth/auth-magiclink-error`
        );
      }
    }
  } catch (error: unknown) {
    console.error('Error in auth callback:', error);
  }

  // return the user to an error page with instructions
  return NextResponse.redirect(`${origin}/auth/callback`);
}
