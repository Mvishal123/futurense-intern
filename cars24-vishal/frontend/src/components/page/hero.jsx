import React from "react";
import Container from "../container";
import { Search } from "lucide-react";

const Hero = () => {
  return (
    <div>
      <div className="relative h-[50rem]">
        <picture className="absolute inset-0 bg-slate-200">
          <img
            src="/hero-image.webp"
            alt=""
            className="h-full object-cover object-center"
            fetchPriority="high"
          />
        </picture>
        <div className="relative h-full pb-10">
          <Container className="flex flex-col justify-end">
            <div className="font-bold text-white">
              <p className="text-[2.4rem]">Your dream car comes with</p>
              <p className="text-[3.6rem]">Zero Down Payment</p>
            </div>
            <div className="mt-24 relative">
              <Search className="absolute top-1/2 -translate-y-1/2 left-3 text-slate-600" />
              <input
                type="search"
                className="w-full md:w-7/12 h-20 rounded-xl  pl-16 text-slate-600 placeholder:text-2xl text-2xl font-semibold pr-5 placeholder:font-semibold"
                placeholder="Search for your favorite car"
              />
            </div>
            <div className="">
              <div className="flex flex-wrap mt-6 items-center gap-8 h-[6.4rem]">
                {CAR_BRANDS.map((brand) => (
                  <div className="h-full w-[8.4rem] bg-white rounded-2xl flex items-center justify-center">
                    <img src={brand.logo} alt={brand.name} className="h-[3.2rem]" />
                  </div>
                ))}
                <button className="bg-[#ef6e0b] px-16 h-full w-auto rounded-2xl text-white font-semibold text-[1.4rem]">
                  View all cars
                </button>
              </div>
            </div>
          </Container>
        </div>
      </div>
    </div>
  );
};

export default Hero;

const CAR_BRANDS = [
  {
    name: "Ford",
    logo: "/ford.webp",
  },
  {
    name: "Hyundai",
    logo: "/hyundai.webp",
  },
  {
    name: "Mahindra",
    logo: "/mahindra.webp",
  },
  {
    name: "Maruti Suzuki",
    logo: "/maruti-suzuki.webp",
  },
  {
    name: "Renault",
    logo: "/renault.webp",
  },
  {
    name: "Tata",
    logo: "/tata.webp",
  },
];
