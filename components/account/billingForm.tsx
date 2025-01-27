"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Download, CreditCard } from "lucide-react";

type Invoice = {
  id: string;
  orderId: string;
  date: string;
  amount: number;
  status: "paid" | "pending" | "refunded";
  receiptUrl: string;
};

export default function BillingForm() {
  const [invoices, setInvoices] = useState<Invoice[]>([
    {
      id: "INV-004",
      orderId: "ORDER-004",
      date: "2023-08-01",
      amount: 19.99,
      status: "pending",
      receiptUrl: "https://app.lemonsqueezy.com/my-orders/...",
    },
    {
      id: "INV-003",
      orderId: "ORDER-003",
      date: "2023-07-01",
      amount: 19.99,
      status: "paid",
      receiptUrl: "https://app.lemonsqueezy.com/my-orders/...",
    },
    {
      id: "INV-002",
      orderId: "ORDER-002",
      date: "2023-06-01",
      amount: 19.99,
      status: "paid",
      receiptUrl: "https://app.lemonsqueezy.com/my-orders/...",
    },
    {
      id: "INV-001",
      orderId: "ORDER-001",
      date: "2023-05-01",
      amount: 19.99,
      status: "refunded",
      receiptUrl: "https://app.lemonsqueezy.com/my-orders/...",
    },
  ]);

  const handleDownload = (receiptUrl: string) => {
    window.open(receiptUrl, "_blank");
  };

  const handlePayNow = (orderId: string) => {
    // TODO: Implement LemonSqueezy checkout for the specific order
    console.log(`Initiating LemonSqueezy checkout for order ${orderId}`);
  };

  return (
    <div className="space-y-6">
      <h2 className="text-2xl font-bold">Billing History</h2>
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>Order ID</TableHead>
            <TableHead>Date</TableHead>
            <TableHead>Amount</TableHead>
            <TableHead>Status</TableHead>
            <TableHead>Action</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {invoices.map((invoice) => (
            <TableRow key={invoice.id}>
              <TableCell>{invoice.orderId}</TableCell>
              <TableCell>{invoice.date}</TableCell>
              <TableCell>${invoice.amount.toFixed(2)}</TableCell>
              <TableCell>
                <Badge
                  variant={
                    invoice.status === "paid"
                      ? "default"
                      : invoice.status === "pending"
                        ? "secondary"
                        : "destructive"
                  }
                >
                  {invoice.status}
                </Badge>
              </TableCell>
              <TableCell>
                {invoice.status === "paid" || invoice.status === "refunded" ? (
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => handleDownload(invoice.receiptUrl)}
                  >
                    <Download className="h-4 w-4 mr-2" />
                    Receipt
                  </Button>
                ) : invoice.status === "pending" ? (
                  <Button
                    variant="default"
                    size="sm"
                    onClick={() => handlePayNow(invoice.orderId)}
                  >
                    <CreditCard className="h-4 w-4 mr-2" />
                    Pay Now
                  </Button>
                ) : (
                  <span className="text-sm text-muted-foreground">N/A</span>
                )}
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  );
}
