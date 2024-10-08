import NextTopLoader from "nextjs-toploader";

import "./globals.css";
import Navbar from "@/components/Navbar";
import SessionWrapper from "@/components/SessionWrapper";
import { Toaster } from "@/components/ui/sonner";

export const metadata = {
  title: "E-Gallery",
  description: "An website that sells artworks",
};

export default function RootLayout({ children }) {
  return (
    <SessionWrapper>
      <html lang="en">
        <body>
          <div className="max-h-[5vh] ">
            <NextTopLoader color="#ef233c" />
            <Navbar />
          </div>
          <div className="min-h-[95vh] pt-[5vh] ">{children}</div>
          <Toaster richColors />
        </body>
      </html>
    </SessionWrapper>
  );
}
