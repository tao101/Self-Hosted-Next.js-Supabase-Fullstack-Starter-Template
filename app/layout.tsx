import { GeistSans } from "geist/font/sans";
import { ThemeProvider } from "next-themes";
import "./globals.css";
import { Toaster } from "@/components/ui/sonner";

import { Inter, Roboto_Mono } from "next/font/google";
import { Providers } from "./providers";

const defaultUrl = process.env.NEXT_PUBLIC_FRONTEND_URL
  ? `https://${process.env.NEXT_PUBLIC_FRONTEND_URL}`
  : "http://localhost:3000";

//TODO: add seo meta tags
export const metadata = {
  metadataBase: new URL(defaultUrl),
  title: "Project",
  description: "Project",
};

const inter = Inter({
  subsets: ["latin"],
  display: "swap",
  variable: "--font-inter",
});

const robotoMono = Roboto_Mono({
  subsets: ["latin"],
  display: "swap",
  variable: "--font-roboto-mono",
});

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html
      lang="en"
      className={`${inter.variable} ${robotoMono.variable}`}
      suppressHydrationWarning
    >
      <body className="w-screen min-h-screen flex flex-col bg-gray-50 text-foreground">
        <Providers>
          <ThemeProvider
            attribute="class"
            defaultTheme="light"
            disableTransitionOnChange
          >
            {children}
            <Toaster richColors closeButton position="top-center" />
          </ThemeProvider>
        </Providers>
      </body>
    </html>
  );
}
