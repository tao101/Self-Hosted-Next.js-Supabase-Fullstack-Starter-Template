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
import { Textarea } from "@/components/ui/textarea";
import { toast } from "sonner";
import { Loader2 } from "lucide-react";

const bulkEmailSchema = z.object({
  emails: z.string().refine((value) => {
    const emails = value.split(/[\s,]+/);
    return emails.every((email) => z.string().email().safeParse(email).success);
  }, "Invalid email address(es) found. Please check and try again."),
});

type BulkEmailFormValues = z.infer<typeof bulkEmailSchema>;

export function BulkEmailVerification() {
  const [isVerifying, setIsVerifying] = useState(false);

  const form = useForm<BulkEmailFormValues>({
    resolver: zodResolver(bulkEmailSchema),
    defaultValues: {
      emails: "",
    },
  });

  const onSubmit = async (data: BulkEmailFormValues) => {
    setIsVerifying(true);
    const emails = data.emails.split(/[\s,]+/);

    try {
      toast.success("Bulk email verification completed");
    } catch (error) {
      console.error("Error verifying emails:", error);
      toast.error("An error occurred while verifying the emails");
    } finally {
      setIsVerifying(false);
    }
  };

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="emails"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Email addresses</FormLabel>
              <FormControl>
                <Textarea
                  placeholder="name1@example.com, name2@example.com"
                  className="min-h-[100px]"
                  {...field}
                />
              </FormControl>
              <FormDescription>
                Enter multiple email addresses separated by commas or new lines.
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
            "Verify Emails"
          )}
        </Button>
      </form>
    </Form>
  );
}
