import Link from "next/link";
import { cn } from "@/lib/utils";
import { Mail } from "lucide-react";

import MobileMenu from "./mobileMenu";
import ActionButton from "./actionButton";
import Logo from "../logo";

const navItems = [
  { name: "Home", href: "/" },
  { name: "Features", href: "/#features" },
  { name: "Pricing", href: "/#pricing" },
  { name: "Contact", href: "/#contact" },
];

//TODO: update header urls
export default function Header() {
  return (
    <header className="bg-white shadow-sm">
      <div className="mx-auto max-w-screen-2xl px-4 sm:px-6 lg:px-8">
        <div className="flex h-16 items-center justify-between">
          <div className="flex items-center">
            <Link href="/" className="flex items-center">
              <Logo />
            </Link>
          </div>
          <nav className="hidden md:flex md:items-center md:space-x-6 flex-grow justify-center">
            {navItems.map((item) => (
              <Link
                key={item.name}
                href={item.href}
                className={cn(
                  "text-base font-medium text-gray-500 hover:text-gray-900"
                )}
              >
                {item.name}
              </Link>
            ))}
          </nav>
          <div className="hidden md:block">
            <ActionButton />
          </div>
          <div className="flex items-center md:hidden">
            <div className="mr-4">
              <ActionButton size="sm" />
            </div>
            <MobileMenu navItems={navItems} />
          </div>
        </div>
      </div>
    </header>
  );
}
