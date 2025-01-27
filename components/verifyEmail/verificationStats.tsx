import VerificationResultCard from "./verificationResultCard";

export default function VerificationStats() {
  const stats = {
    valid: 150,
    invalid: 50,
    acceptAll: 30,
  };

  return (
    <div className="grid gap-4 md:grid-cols-3 mb-8">
      <VerificationResultCard
        title="Valid Emails"
        count={stats.valid}
        icon="valid"
        isLoading={false}
      />
      <VerificationResultCard
        title="Invalid Emails"
        count={stats.invalid}
        icon="invalid"
        isLoading={false}
      />
      <VerificationResultCard
        title="Accept-All Servers"
        count={stats.acceptAll}
        icon="accept-all"
        isLoading={false}
      />
    </div>
  );
}
