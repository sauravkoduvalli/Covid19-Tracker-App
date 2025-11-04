import Navbar from "./Navbar";
import { Outlet } from "react-router";

const layout = () => {
  return (
    <>
      <Navbar />
      <Outlet />
    </>
  );
};

export default layout;
