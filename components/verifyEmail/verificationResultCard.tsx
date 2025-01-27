import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { CheckCircle, XCircle, AlertTriangle, Loader2 } from "lucide-react";

type VerificationResultCardProps = {
  title: string;
  count: number;
  icon: "valid" | "invalid" | "accept-all";
  isLoading: boolean;
};

export default function VerificationResultCard({
  title,
  count,
  icon,
  isLoading,
}: VerificationResultCardProps) {
  const iconMap = {
    valid: <CheckCircle className="h-6 w-6 text-green-500" />,
    invalid: <XCircle className="h-6 w-6 text-red-500" />,
    "accept-all": <AlertTriangle className="h-6 w-6 text-yellow-500" />,
  };

  return (
    <Card className="relative overflow-hidden">
      <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
        <CardTitle className="text-sm font-medium">{title}</CardTitle>
        {isLoading ? (
          <Loader2 className="h-6 w-6 text-blue-500 animate-spin" />
        ) : (
          iconMap[icon]
        )}
      </CardHeader>
      <CardContent>
        <div className="text-2xl font-bold">{count}</div>
      </CardContent>
      {isLoading && (
        <div className="absolute inset-0 bg-background/50 backdrop-blur-sm flex items-center justify-center">
          <Loader2 className="h-8 w-8 text-primary animate-spin" />
        </div>
      )}
    </Card>
  );
}
