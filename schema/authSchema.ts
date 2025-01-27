import { z } from "zod";

const emailSchema = z.string().trim().email("Invalid email address");

const firstNameSchema = z
  .string()
  .trim()
  .min(1, "First name is required")
  .optional();

const lastNameSchema = z
  .string()
  .trim()
  .min(1, "Last name is required")
  .optional();

const otpSchema = z
  .string()
  .trim()
  .min(6, "OTP must be at least 6 characters")
  .max(10)
  .optional();

const authSchema = z.object({
  email: emailSchema,
  firstName: firstNameSchema,
  lastName: lastNameSchema,
  otp: otpSchema,
});

export type AuthSchema = z.infer<typeof authSchema>;

export default authSchema;
