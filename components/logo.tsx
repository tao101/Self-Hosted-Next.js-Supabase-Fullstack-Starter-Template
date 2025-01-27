export default function Logo({ className }: { className?: string }) {
  return (
    <div className={`flex items-center ${className}`}>
      <span className="text-3xl font-extrabold tracking-tight">
        <span className="text-gray-800">WEB</span>
        <span className="text-[#34CCFF]">LOGO</span>
      </span>
    </div>
  );
}
