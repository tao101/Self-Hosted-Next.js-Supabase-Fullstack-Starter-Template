"use client";

import { useState } from "react";
import { motion } from "framer-motion";
import { Button } from "@/components/ui/button";
import GoogleSignInButton from "./googleSignInButton";
import SignupVerificationForm from "./signupVerificationForm";
import RegistrationForm from "./registrationForm";
import SigninVerificationForm from "./signinVerificationForm";
import EmailForm from "./emailForm";

export default function AuthForm() {
  const [isSignUp, setIsSignUp] = useState(false);
  const [isVerifying, setIsVerifying] = useState(false);
  const [email, setEmail] = useState("");

  const handleRegistrationComplete = (email: string) => {
    setEmail(email);
    setIsVerifying(true);
  };

  const handleEmailSubmit = (email: string) => {
    setEmail(email);
    setIsVerifying(true);
  };

  const handleVerificationComplete = () => {
    // TODO: Handle successful verification (e.g., redirect to dashboard)
    console.log("Verification completed successfully");
  };

  const resetForm = () => {
    setIsVerifying(false);
    setEmail("");
  };

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.5 }}
    >
      <GoogleSignInButton isSignUp={isSignUp} />

      <div className="relative mb-4">
        <div className="absolute inset-0 flex items-center">
          <span className="w-full border-t" />
        </div>
        <div className="relative flex justify-center text-xs uppercase">
          <span className="bg-white px-2 text-muted-foreground">Or</span>
        </div>
      </div>

      {isSignUp ? (
        isVerifying ? (
          <SignupVerificationForm
            email={email}
            onVerificationComplete={handleVerificationComplete}
          />
        ) : (
          <RegistrationForm
            onRegistrationComplete={handleRegistrationComplete}
          />
        )
      ) : isVerifying ? (
        <SigninVerificationForm
          email={email}
          onVerificationComplete={handleVerificationComplete}
        />
      ) : (
        <EmailForm onEmailSubmit={handleEmailSubmit} />
      )}

      <div className="mt-6 text-sm text-center">
        {isSignUp ? "Already have an account? " : "Don't have an account? "}
        <Button
          variant="link"
          className="p-0 text-[#34CCFF] hover:underline"
          onClick={() => {
            setIsSignUp(!isSignUp);
            resetForm();
          }}
        >
          {isSignUp ? "Sign In" : "Sign Up"}
        </Button>
      </div>
    </motion.div>
  );
}
