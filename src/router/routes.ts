import { createBrowserRouter } from "react-router";
import Home from "../pages/Home";
import Details from "../pages/Details";
import layout from "../layout/layout";

export const router = createBrowserRouter([
    {
        path: '/',
        Component: layout,
        children: [
            { index: true, Component: Home },
            { path: "details", Component: Details },
        ]
    },

])