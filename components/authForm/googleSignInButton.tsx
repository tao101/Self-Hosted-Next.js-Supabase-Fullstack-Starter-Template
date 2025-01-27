"use client";

import { Button } from "@/components/ui/button";
import { supabaseClient } from "@/utils/supabase/client";
import { toast } from "sonner";
import GoogleIcon from "./googleIcon";

interface GoogleSignInButtonProps {
  isSignUp: boolean;
}

export default function GoogleSignInButton({
  isSignUp,
}: GoogleSignInButtonProps) {
  const handleGoogleSignIn = async () => {
    try {
      const { error } = await supabaseClient.auth.signInWithOAuth({
        provider: "google",
      });
      if (error) {
        throw new Error(error.message);
      }
    } catch (error) {
      console.error("Google sign in error:", error);
      toast.error("An error occurred with Google Sign-In. Please try again.", {
        description:
          error instanceof Error
            ? error.message
            : "An error occurred with Google Sign-In. Please try again.",
      });
    }
  };

  return (
    <Button
      variant="outline"
      className="w-full mb-4"
      onClick={handleGoogleSignIn}
    >
      <GoogleIcon />
      Sign {isSignUp ? "Up" : "In"} with Google
    </Button>
  );
}
