"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
  CardFooter,
} from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Check } from "lucide-react";
import { toast } from "sonner";

type Plan = "free" | "starter" | "growth" | "pro" | "enterprise";

type SubscriptionData = {
  currentPlan: Plan;
  expiryDate?: string;
};


const planDetails: Record<
  Plan,
  {
    name: string;
    price: string;
    features: string[];
    color: string;
  }
> = {
  free: {
    name: "Free",
    price: "$0/month",
    features: [
      "5 email verifications/month",
      "5 email searches/month",
      "1 company search/month",
      "API access",
    ],
    color: "bg-gray-100 hover:bg-gray-200",
  },
  starter: {
    name: "Starter",
    price: "$9.99/month",
    features: [
      "100 email verifications/month",
      "50 email searches/month",
      "10 company searches/month",
      "API access",
    ],
    color: "bg-blue-100 hover:bg-blue-200",
  },
  growth: {
    name: "Growth",
    price: "$29.99/month",
    features: [
      "500 email verifications/month",
      "250 email searches/month",
      "50 company searches/month",
      "API access",
      "Priority support",
    ],
    color: "bg-green-100 hover:bg-green-200",
  },
  pro: {
    name: "Pro",
    price: "$49.99/month",
    features: [
      "1000 email verifications/month",
      "500 email searches/month",
      "100 company searches/month",
      "API access",
      "Priority support",
      "Custom integrations",
    ],
    color: "bg-purple-100 hover:bg-purple-200",
  },
  enterprise: {
    name: "Enterprise",
    price: "Custom pricing",
    features: [
      "Unlimited email verifications",
      "Unlimited email searches",
      "Unlimited company searches",
      "API access",
      "24/7 Priority support",
      "Custom integrations",
      "Dedicated account manager",
    ],
    color: "bg-indigo-100 hover:bg-indigo-200",
  },
};

//TODO: Add subscription form
export default function SubscriptionForm() {
  const [subscriptionData, setSubscriptionData] = useState<SubscriptionData>({
    currentPlan: "growth",
  });

  const handlePlanChange = (plan: Plan) => {
    if (plan === subscriptionData.currentPlan) {
      toast.info("You are already subscribed to this plan.");
      return;
    }

    if (plan === "enterprise") {
      toast.success("Redirecting to contact sales for Enterprise plan...");
      // Here you would typically redirect to a contact sales page or open a modal
      return;
    }

    const action =
      plan === "free" ||
      planDetails[plan].price < planDetails[subscriptionData.currentPlan].price
        ? "downgrade"
        : "upgrade";

    toast.success(
      `Redirecting to ${action} to ${planDetails[plan].name} plan...`
    );
    // Here you would typically redirect to LemonSqueezy checkout or API call
  };

  const handleCancelSubscription = () => {
    // In a real application, this would call an API to cancel the subscription
    toast.success("Initiating subscription cancellation process...");
    // Here you would typically show a confirmation dialog and then call the cancellation API
  };

  return (
    <div className="space-y-8   mx-auto">
      <div className="flex flex-col gap-4 xl:flex-row justify-between items-start xl:items-center mb-6">
        <h2 className="text-2xl sm:text-3xl font-bold mb-2 sm:mb-0">
          Subscription Management
        </h2>
        <div className="flex  flex-1 flex-row justify-end items-center gap-2">
          <Badge
            variant="outline"
            className="w-fit text-base py-1.5 px-4 rounded-md"
          >
            Current Plan: {planDetails[subscriptionData.currentPlan].name}
          </Badge>
          {subscriptionData.currentPlan !== "free" && (
            <Button
              variant="destructive"
              size="sm"
              onClick={handleCancelSubscription}
              className="w-fit rounded-3xl"
            >
              Cancel Subscription
            </Button>
          )}
        </div>
      </div>

      {subscriptionData.currentPlan !== "free" &&
        subscriptionData.expiryDate && (
          <p className="text-muted-foreground">
            Your subscription will expire on {subscriptionData.expiryDate}
          </p>
        )}

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-5 gap-8">
        {(Object.keys(planDetails) as Plan[]).map((plan) => (
          <Card
            key={plan}
            className={`${planDetails[plan].color} border-2 ${subscriptionData.currentPlan === plan ? "border-primary" : "border-transparent"} flex flex-col h-full`}
          >
            <CardHeader className="flex-grow space-y-2 pb-6">
              <CardTitle className="text-2xl">
                {planDetails[plan].name}
              </CardTitle>
              <CardDescription className="text-2xl font-bold">
                {planDetails[plan].price}
              </CardDescription>
            </CardHeader>
            <CardContent className="flex-grow pt-0 pb-6">
              <ul className="space-y-4">
                {planDetails[plan].features.map((feature, index) => (
                  <li key={index} className="flex items-start gap-3">
                    <Check className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                    <span className="text-sm">{feature}</span>
                  </li>
                ))}
              </ul>
            </CardContent>
            <CardFooter className="pt-6">
              <Button
                className="w-full h-11 text-base"
                variant={
                  subscriptionData.currentPlan === plan ? "outline" : "default"
                }
                onClick={() => handlePlanChange(plan)}
              >
                {subscriptionData.currentPlan === plan
                  ? "Current Plan"
                  : plan === "enterprise"
                    ? "Contact Sales"
                    : "Select Plan"}
              </Button>
            </CardFooter>
          </Card>
        ))}
      </div>
    </div>
  );
}
