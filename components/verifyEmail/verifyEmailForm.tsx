"use client";
import { useState } from "react";

import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { SingleEmailVerification } from "./singleEmailVerification";
import { BulkEmailVerification } from "./bulkEmailVerification";

export type VerificationResult = {
  email: string;
  isValid: boolean;
  isAcceptAll: boolean;
  timestamp: Date;
  details: {
    regexp: boolean;
    gibberish: boolean;
    disposable: boolean;
    webmail: boolean;
    mx_records: boolean;
    smtp_server: boolean;
    smtp_check: boolean;
    accept_all: boolean;
  };
};

export type HistoryEntry = {
  timestamp: Date;
  emails: string[];
  results: VerificationResult[];
  cost: number;
  isVerifying: boolean;
};

export default function VerifyEmailForm() {
  const [verificationResults, setVerificationResults] = useState<
    VerificationResult[]
  >([]);
  const [history, setHistory] = useState<HistoryEntry[]>([]);

  const addToHistory = (entry: HistoryEntry) => {
    setHistory((prevHistory) => [entry, ...prevHistory]);
  };

  const addVerificationResult = (result: VerificationResult) => {
    setVerificationResults((prevResults) => [...prevResults, result]);
  };

  return (
    <div className="space-y-8">
      <Tabs defaultValue="single" className="w-full">
        <TabsList className="grid w-full grid-cols-2">
          <TabsTrigger value="single">Single Email</TabsTrigger>
          <TabsTrigger value="bulk">Bulk Emails</TabsTrigger>
        </TabsList>
        <TabsContent value="single">
          <SingleEmailVerification />
        </TabsContent>
        <TabsContent value="bulk">
          <BulkEmailVerification />
        </TabsContent>
      </Tabs>
    </div>
  );
}
