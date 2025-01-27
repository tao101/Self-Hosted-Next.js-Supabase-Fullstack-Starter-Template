import { z } from "zod";

export const emailSignupSchema = z.object({
  email: z.string().email(),
});
