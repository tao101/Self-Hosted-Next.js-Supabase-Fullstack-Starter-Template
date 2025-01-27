"use client";

import { useEffect, useState } from "react";
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
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { toast } from "sonner";
import { Switch } from "@/components/ui/switch";
import { observer } from "@legendapp/state/react";
import { userStore } from "@/stores/userProvider";
import { sleep } from "@/utils/utils";
import { supabaseClient } from "@/utils/supabase/client";
import DeleteAccountDialog from "./deleteAccountDialog";

const profileFormSchema = z.object({
  firstName: z.string().min(1, {
    message: "First name must be at least 1 character.",
  }),
  lastName: z.string().min(1, {
    message: "Last name must be at least 1 characters.",
  }),
  email: z.string().email({
    message: "Please enter a valid email address.",
  }),
  avatar: z.any().optional(),
  marketingEmails: z.boolean().default(true),
});

type ProfileFormValues = z.infer<typeof profileFormSchema>;

function ProfileForm() {
  const user = userStore.user.get();
  const [avatarSrc, setAvatarSrc] = useState(user?.user_metadata?.avatar_url);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    setAvatarSrc(user?.user_metadata?.avatar_url);
  }, [user?.user_metadata?.avatar_url]);

  const form = useForm<ProfileFormValues>({
    resolver: zodResolver(profileFormSchema),
    defaultValues: {
      firstName: user?.user_metadata?.firstName || "",
      lastName: user?.user_metadata?.lastName || "",
      email: user?.email || "",
      marketingEmails: user?.user_metadata?.receiveMarketingEmails,
      avatar: "",
    },
    values: {
      firstName: user?.user_metadata?.firstName || "",
      lastName: user?.user_metadata?.lastName || "",
      email: user?.email || "",
      marketingEmails: user?.user_metadata?.receiveMarketingEmails,
      avatar: "",
    },
  });

  const onSubmit = async ({
    firstName,
    lastName,
    email,
    marketingEmails,
  }: ProfileFormValues) => {
    let toastId: string | number | undefined = undefined;
    try {
      console.log("user data", firstName, lastName, email, marketingEmails);
      setLoading(true);
      toastId = toast.loading("Updating profile...");
      const { error: updateError } = await supabaseClient.auth.updateUser({
        email: email,
        data: {
          firstName,
          lastName,
          receiveMarketingEmails: marketingEmails,
          name: `${firstName} ${lastName}`,
        },
      });
      if (updateError) {
        throw updateError;
      }
      toast.dismiss(toastId);
      toast.success("Profile updated successfully!");
    } catch (error) {
      console.error("error updating profile", error);
      let message =
        error instanceof Error ? error.message : "Something went wrong";
      if (toastId) {
        toast.dismiss(toastId);
      }
      toast.error("Failed to update profile: " + message);
    } finally {
      setLoading(false);
    }
  };

  const handleAvatarChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    let toastId: string | number | undefined = undefined;
    try {
      const file = e.target.files?.[0];

      if (file) {
        setAvatarSrc(URL.createObjectURL(file));
        toastId = toast.loading("Uploading avatar...");
        let fileExt = file.name.split(".").pop();
        let fileName = `${user?.id}/${user?.id}-${Date.now()}.${fileExt}`;
        const { error: uploadError, data: uploadData } =
          await supabaseClient.storage
            .from("user_avatars")
            .upload(fileName, file);

        if (uploadError) {
          throw uploadError;
        }

        let path = uploadData.path;

        const { data: signedData, error: signedError } =
          await supabaseClient.storage
            .from("user_avatars")
            .createSignedUrl(path, 60 * 60 * 24 * 365 * 10);

        if (signedError) {
          throw signedError;
        }

        const publicUrl = signedData.signedUrl;

        console.log("publicUrl ", publicUrl);

        const { error: updateError } = await supabaseClient.auth.updateUser({
          data: {
            avatar_url: publicUrl,
          },
        });

        if (updateError) {
          throw updateError;
        }
        toast.dismiss(toastId);
        toast.success("Avatar uploaded successfully!");
      }
    } catch (error: unknown) {
      console.error("error uploading avatar ", error);
      let message =
        error instanceof Error ? error.message : "Something went wrong";
      if (toastId) {
        toast.dismiss(toastId);
      }
      toast.error("Failed to upload avatar : " + message);
    } finally {
      if (toastId) {
        toast.dismiss(toastId);
      }
    }
  };

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="avatar"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Profile Picture</FormLabel>
              <FormControl>
                <div className="flex items-center space-x-4">
                  <Avatar className="w-20 h-20">
                    <AvatarImage src={avatarSrc} alt="Profile picture" />
                    <AvatarFallback>
                      {user?.user_metadata?.firstName?.charAt(0)}
                      {user?.user_metadata?.lastName?.charAt(0)}
                    </AvatarFallback>
                  </Avatar>
                  <Input
                    type="file"
                    accept="image/*"
                    onChange={handleAvatarChange}
                  />
                </div>
              </FormControl>
            </FormItem>
          )}
        />
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
                <Input placeholder="john.doe@example.com" {...field} />
              </FormControl>
              <FormDescription>
                You will need to confirm any email changes by clicking the link
                sent to your current email address to confirm the change and
                re-logging in again.
              </FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="marketingEmails"
          render={({ field }) => (
            <FormItem className="flex flex-col sm:flex-row items-start sm:items-center justify-between rounded-lg border p-4 space-y-2 sm:space-y-0">
              <div className="space-y-0.5">
                <FormLabel className="text-base">Marketing Emails</FormLabel>
                <FormDescription>
                  Receive emails about new features and promotions.
                </FormDescription>
              </div>
              <FormControl>
                <Switch
                  checked={field.value}
                  onCheckedChange={field.onChange}
                />
              </FormControl>
            </FormItem>
          )}
        />

        <div className="flex justify-between items-center">
          <DeleteAccountDialog />
          <Button type="submit" disabled={loading}>
            {loading ? (
              <>
                <span className="mr-2">Updating...</span>
                <span className="animate-spin">⚪</span>
              </>
            ) : (
              "Update Profile"
            )}
          </Button>
        </div>
      </form>
    </Form>
  );
}

export default observer(ProfileForm);
