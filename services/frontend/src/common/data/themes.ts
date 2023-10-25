import { createTheme } from "@mui/material/styles";

export const darkTheme = createTheme({
    palette: {
        mode: "dark",
        text: {
            primary: "white",
        },
        background: {
            default: "#606060",
        },
    },
});

export const lightTheme = createTheme({
    palette: {
        mode: "light",
        text: {
            primary: "black",
        },
        background: {
            default: "#65EC22",
        },
    },
});
