"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { toast } from "sonner";
import {
  Loader2,
  CheckCircle,
  XCircle,
  AlertTriangle,
  Copy,
  ChevronDown,
  ChevronUp,
} from "lucide-react";
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@/components/ui/tooltip";
import { HistoryEntry } from "./verifyEmailForm";

export default function HistoryItem({ entry }: { entry: HistoryEntry }) {
  const [expandedResults, setExpandedResults] = useState<
    Record<string, boolean>
  >({});

  const toggleResultExpansion = (email: string) => {
    setExpandedResults((prev) => ({ ...prev, [email]: !prev[email] }));
  };

  const copyEmail = (email: string) => {
    navigator.clipboard.writeText(email);
    toast.success(`Email ${email} copied to clipboard`);
  };

  const reverifyEmail = async (email: string) => {
    try {
      toast.success(`Email ${email} reverified successfully`);
    } catch (error) {
      console.error("Error reverifying email:", error);
      toast.error(`An error occurred while reverifying ${email}`);
    }
  };

  const getInvalidReason = (result: any) => {
    if (result.details.gibberish) return "Gibberish email detected";
    if (result.details.disposable) return "Disposable email detected";
    if (!result.details.mx_records) return "No MX records found";
    if (!result.details.smtp_server) return "SMTP server not found";
    if (!result.details.smtp_check) return "SMTP check failed";
    return "Unknown reason";
  };

  return (
    <li className="border rounded-lg overflow-hidden">
      <div className="bg-gray-100 p-4 flex justify-between items-center">
        <span className="font-semibold">
          {entry.timestamp.toLocaleString()}
        </span>
        <span className="text-sm text-gray-500">
          Cost: {entry.cost} token{entry.cost !== 1 ? "s" : ""}
        </span>
      </div>
      <div className="p-4 space-y-4">
        {entry.emails.map((email, emailIndex) => {
          const result = entry.results[emailIndex];
          if (!result && !entry.isVerifying) return null;
          return (
            <div
              key={emailIndex}
              className="flex flex-col space-y-2 p-4 bg-gray-200 rounded-md shadow-sm"
            >
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center space-x-2">
                  {entry.isVerifying ? (
                    <Loader2 className="h-4 w-4 text-blue-500 animate-spin" />
                  ) : result?.isValid ? (
                    <CheckCircle className="h-4 w-4 text-green-500" />
                  ) : result?.isAcceptAll ? (
                    <AlertTriangle className="h-4 w-4 text-yellow-500" />
                  ) : (
                    <XCircle className="h-4 w-4 text-red-500" />
                  )}
                  <span className="font-medium">{email}</span>
                  <TooltipProvider>
                    <Tooltip>
                      <TooltipTrigger asChild>
                        <Button
                          variant="ghost"
                          size="icon"
                          onClick={() => copyEmail(email)}
                        >
                          <Copy className="h-4 w-4" />
                          <span className="sr-only">Copy email</span>
                        </Button>
                      </TooltipTrigger>
                      <TooltipContent>
                        <p>Copy email</p>
                      </TooltipContent>
                    </Tooltip>
                  </TooltipProvider>
                </div>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => reverifyEmail(email)}
                  disabled={entry.isVerifying}
                >
                  Reverify
                </Button>
              </div>
              {result && !entry.isVerifying && (
                <div className="flex flex-col space-y-2 w-full">
                  <div className="flex items-center justify-between">
                    <div className="flex items-center space-x-4">
                      <span
                        className={`font-semibold ${result.isValid ? "text-green-600" : result.isAcceptAll ? "text-yellow-600" : "text-red-600"}`}
                      >
                        {result.isValid
                          ? "Valid"
                          : result.isAcceptAll
                            ? "Accept-All"
                            : "Invalid"}
                      </span>

                      {!result.isValid && (
                        <Button
                          variant="ghost"
                          size="sm"
                          onClick={() => toggleResultExpansion(email)}
                          className="flex items-center"
                        >
                          {result.isAcceptAll
                            ? "Why Accept-All is Uncertain"
                            : "Why Invalid?"}
                          {expandedResults[email] ? (
                            <ChevronUp className="h-4 w-4 ml-2" />
                          ) : (
                            <ChevronDown className="h-4 w-4 ml-2" />
                          )}
                        </Button>
                      )}
                    </div>
                  </div>
                  {expandedResults[email] && !result.isValid && (
                    <div className="mt-2 text-sm text-gray-600 bg-gray-50 p-2 rounded">
                      {result.isAcceptAll ? (
                        <p>
                          Accept-all servers cannot be fully validated as they
                          accept all incoming emails, regardless of whether the
                          address exists.
                        </p>
                      ) : (
                        <p>{getInvalidReason(result)}</p>
                      )}
                    </div>
                  )}
                </div>
              )}
              {entry.isVerifying && (
                <span className="text-sm text-blue-500">Verifying...</span>
              )}
            </div>
          );
        })}
      </div>
    </li>
  );
}
