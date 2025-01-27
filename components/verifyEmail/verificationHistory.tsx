"use client";

import { useState } from "react";
import { Filter } from "lucide-react";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import HistoryItem from "./historyItem";

type FilterType = "all" | "valid" | "invalid" | "accept-all";

export function VerificationHistory() {
  const [filter, setFilter] = useState<FilterType>("all");

  const filteredHistory = [
    {
      timestamp: new Date(),
      emails: ["test@test.com"],
      cost: 1,
      isVerifying: false,
      results: [
        {
          email: "test@test.com",
          isValid: true,
          isAcceptAll: false,
          timestamp: new Date(),
          details: {
            regexp: true,
            gibberish: false,
            disposable: false,
            webmail: false,
            mx_records: true,
            smtp_server: true,
            smtp_check: true,
            accept_all: false,
          },
        },
      ],
    },
    {
      timestamp: new Date(),
      emails: ["test2@test.com"],
      cost: 1,
      isVerifying: false,
      results: [
        {
          email: "test2@test.com",
          isValid: false,
          isAcceptAll: false,
          timestamp: new Date(),
          details: {
            regexp: false,
            gibberish: true,
            disposable: false,
            webmail: false,
            mx_records: false,
            smtp_server: false,
            smtp_check: false,
            accept_all: false,
          },
        },
      ],
    },
    {
      timestamp: new Date(),
      emails: ["test3@test.com"],
      cost: 1,
      isVerifying: false,
      results: [
        {
          email: "test3@test.com",
          isValid: true,
          isAcceptAll: true,
          timestamp: new Date(),
          details: {
            regexp: true,
            gibberish: false,
            disposable: false,
            webmail: false,
            mx_records: true,
            smtp_server: true,
            smtp_check: true,
            accept_all: true,
          },
        },
      ],
    },
  ]
    .map((entry) => ({
      ...entry,
      results: entry.results.filter((result) => {
        if (filter === "all") return true;
        if (filter === "valid") return result.isValid && !result.isAcceptAll;
        if (filter === "invalid") return !result.isValid && !result.isAcceptAll;
        if (filter === "accept-all") return result.isAcceptAll;
        return true;
      }),
    }))
    .filter((entry) => entry.results.length > 0 || entry.isVerifying);

  return (
    <div className="mt-8">
      <div className="flex flex-col gap-2.5 md:flex-row  justify-between md:items-center mb-4">
        <h2 className="text-2xl font-bold">Verification History</h2>
        <div className="flex items-center  space-x-2 ">
          <Filter className="h-4 w-4 text-gray-500" />
          <Select
            value={filter}
            onValueChange={(value: FilterType) => setFilter(value)}
          >
            <SelectTrigger className="w-[180px]">
              <SelectValue placeholder="Filter results" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All Results</SelectItem>
              <SelectItem value="valid">Valid Emails</SelectItem>
              <SelectItem value="invalid">Invalid Emails</SelectItem>
              <SelectItem value="accept-all">Accept-All Servers</SelectItem>
            </SelectContent>
          </Select>
        </div>
      </div>
      <ul className="space-y-4">
        {filteredHistory.map((entry, index) => (
          <HistoryItem key={index} entry={entry} />
        ))}
      </ul>
    </div>
  );
}
