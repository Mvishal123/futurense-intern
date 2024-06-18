import React from "react";
import Container from "../container";
import { Link } from "react-router-dom";
import { ChevronDown, Heart, UserCircle2Icon } from "lucide-react";

const Header = () => {
  return (
    <header className="h-[8rem] sticky top-0 inset-x-0 bg-white z-[999]">
      <Container className="h-full flex items-center justify-between">
        <div>
          <img src="/logo-main.webp" alt="logo" className="h-[4rem]" />
        </div>
        <nav className="hidden md:block">
          <ul className="flex gap-8 uppercase font-semibold">
            {NAV_ITEMS.map((item, index) => (
              <li key={index} className="text-[1.4rem] relative group text-slate-600">
                <Link to={item.href}>{item.label}</Link>
                <span className="absolute -bottom-3 w-full bg-orange-500 h-1.5 left-0 rounded-t-xl hidden group-hover:inline-block"></span>
              </li>
            ))}
          </ul>
        </nav>
        <div className="flex items-center gap-12 text-slate-700">
          <div>
            <span className="sr-only" />
            <Heart />
          </div>
          <div>
            <span className="sr-only" />
            <UserCircle2Icon />
          </div>
          <div className="flex flex-col gap-4 group">
            <p className="text-xl font-semibold text-slate-500">
              Hello, Sign in
            </p>
            <div className="text-[1.6rem] font-semibold flex items-center gap-1">
                Account
                <ChevronDown className="group-hover:-rotate-180 transition-transform"/>
            </div>
          </div>
        </div>
      </Container>
    </header>
  );
};

export default Header;

const NAV_ITEMS = [
  {
    label: "Buy a car",
    href: "#",
  },
  {
    label: "Sell a car",
    href: "#",
  },
  {
    label: "Car finance",
    href: "#",
  },
  {
    label: "New cars",
    href: "#",
  },
  {
    label: "Car service",
    href: "#",
  },
];
