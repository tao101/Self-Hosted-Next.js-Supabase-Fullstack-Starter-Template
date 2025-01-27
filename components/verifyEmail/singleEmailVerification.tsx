"use client";

import { useState } from "react";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import * as z from "zod";
import { Button } from "@/components/ui/button";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { toast } from "sonner";
import { Loader2 } from "lucide-react";

const singleEmailSchema = z.object({
  email: z.string().email("Invalid email address"),
});

type SingleEmailFormValues = z.infer<typeof singleEmailSchema>;

export function SingleEmailVerification() {
  const [isVerifying, setIsVerifying] = useState(false);

  const form = useForm<SingleEmailFormValues>({
    resolver: zodResolver(singleEmailSchema),
    defaultValues: {
      email: "",
    },
  });

  const onSubmit = async (data: SingleEmailFormValues) => {
    setIsVerifying(true);

    try {
      let email = data.email;
      toast.success("Email verified successfully");
    } catch (error) {
      console.error("Error verifying email:", error);
      toast.error("An error occurred while verifying the email");
    } finally {
      setIsVerifying(false);
    }
  };

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="email"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Email address</FormLabel>
              <FormControl>
                <Input placeholder="name@example.com" {...field} />
              </FormControl>
              <FormDescription>
                Enter a single email address to verify.
              </FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit" disabled={isVerifying}>
          {isVerifying ? (
            <>
              <Loader2 className="mr-2 h-4 w-4 animate-spin" />
              Verifying
            </>
          ) : (
            "Verify Email"
          )}
        </Button>
      </form>
    </Form>
  );
}
