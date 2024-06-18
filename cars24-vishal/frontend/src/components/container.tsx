import clsx from "clsx";
import React from "react";

const Container = ({ children, className="" }) => {
  return <div className={clsx("max-w-[128rem] mx-auto px-[1.5rem] h-full w-full", className)}>{children}</div>;
};

export default Container;
