import AuthForm from "@/components/authForm/authForm";
import Logo from "@/components/logo";
import { Card, CardContent } from "@/components/ui/card";
import { Metadata } from "next";

export default function GetStartedPage() {
  return (
    <div className=" flex-1 flex items-center justify-center ">
      <Card className="w-full max-w-md">
        <CardContent className="pt-6">
          <div className="text-center mb-6 flex flex-col items-center justify-center gap-2">
            <h1 className="text-3xl font-bold text-gray-900 mb-2">
              Get Started with
            </h1>
            <Logo />
            <p className="text-base text-gray-600">
              And discover emails effortlessly
            </p>
          </div>
          <AuthForm />
        </CardContent>
      </Card>
    </div>
  );
}
