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

const registrationSchema = z.object({
  email: z.string().email("Invalid email address"),
  firstName: z.string().min(1, "First name is required"),
  lastName: z.string().min(1, "Last name is required"),
});

type RegistrationSchema = z.infer<typeof registrationSchema>;

interface RegistrationFormProps {
  onRegistrationComplete: (email: string) => void;
}

export default function RegistrationForm({
  onRegistrationComplete,
}: RegistrationFormProps) {
  const [isLoading, setIsLoading] = useState(false);

  const form = useForm<RegistrationSchema>({
    resolver: zodResolver(registrationSchema),
    defaultValues: {
      email: "",
      firstName: "",
      lastName: "",
    },
  });

  const onSubmit = async (data: RegistrationSchema) => {
    setIsLoading(true);
    try {
      // TODO: Implement registration logic here
      console.log("Registration data:", data);

      let firstName =
        data.firstName.charAt(0).toUpperCase() + data.firstName.slice(1);
      let lastName =
        data.lastName.charAt(0).toUpperCase() + data.lastName.slice(1);

      const { error, data: supaData } = await supabaseClient.auth.signInWithOtp(
        {
          email: data.email,
          options: {
            //emailRedirectTo: `${window.location.origin}/dashboard`,
            shouldCreateUser: true,
            data: {
              firstName: firstName,
              lastName: lastName,
              name: `${firstName} ${lastName}`,
              receiveMarketingEmails: true,
            },
          },
        }
      );

      console.log("supaData", supaData);
      console.log("error", error);

      if (error) {
        throw new Error(error.message);
      }

      toast.success("Registration initiated", {
        description:
          "Check your email for the OTP to complete your registration.",
      });
      onRegistrationComplete(data.email);
    } catch (error) {
      console.error("Registration error:", error);
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
          name="firstName"
          render={({ field }) => (
            <FormItem>
              <FormLabel>First Name</FormLabel>
              <FormControl>
                <Input placeholder="John" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="lastName"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Last Name</FormLabel>
              <FormControl>
                <Input placeholder="Doe" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
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
              Register
            </>
          )}
        </Button>
      </form>
    </Form>
  );
}
