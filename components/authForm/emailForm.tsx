"use client";

import { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { MailIcon } from "lucide-react";
import { toast } from "sonner";
import { supabaseClient } from "@/utils/supabase/client";

const emailSchema = z.object({
  email: z.string().email("Invalid email address"),
});

type EmailSchema = z.infer<typeof emailSchema>;

interface EmailFormProps {
  onEmailSubmit: (email: string) => void;
}

export default function EmailForm({ onEmailSubmit }: EmailFormProps) {
  const [isLoading, setIsLoading] = useState(false);

  const form = useForm<EmailSchema>({
    resolver: zodResolver(emailSchema),
    defaultValues: {
      email: "",
    },
  });

  const onSubmit = async (data: EmailSchema) => {
    setIsLoading(true);
    try {
      // TODO: Implement magic link / OTP sending logic here
      console.log("Sending OTP to:", data.email);

      const { error, data: supaData } = await supabaseClient.auth.signInWithOtp(
        {
          email: data.email,
          options: {
            //emailRedirectTo: `${window.location.origin}/dashboard`,
            shouldCreateUser: false,
          },
        }
      );

      console.log("supaData", supaData);
      console.log("error", JSON.stringify(error));

      if (error) {
        if (error.code === "otp_disabled") {
          throw new Error(
            "Email does not have an account. Please sign up first."
          );
        } else {
          throw new Error(error.message);
        }
      }

      toast.success("OTP sent", {
        description: "Check your email for the 6-digit OTP.",
      });
      onEmailSubmit(data.email);
    } catch (error) {
      console.error("Authentication error:", error);
      toast.error("Error", {
        description:
          error instanceof Error
            ? error.message
            : "An error occurred while sending the OTP. Please try again.",
      });
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
        <FormField
          control={form.control}
          name="email"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Email</FormLabel>
              <FormControl>
                <Input placeholder="you@example.com" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button
          type="submit"
          className="w-full bg-[#34CCFF] hover:bg-[#2AB8E8]"
          disabled={isLoading}
        >
          {isLoading ? (
            <>
              <span className="mr-2">Processing...</span>
              <span className="animate-spin">⚪</span>
            </>
          ) : (
            <>
              <MailIcon className="mr-2 h-4 w-4" />
              Send OTP & Magic Link
            </>
          )}
        </Button>
      </form>
    </Form>
  );
}
