import Footer from "@/components/footer/footer";
import Header from "@/components/header/header";

export default function PublicLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="flex-1 flex flex-col">
      <Header />
      <main className="mx-auto w-full flex-1 flex flex-col  max-w-screen-2xl px-4 sm:px-6 lg:px-8 py-16">
        {children}
      </main>
      <Footer />
    </div>
  );
}
