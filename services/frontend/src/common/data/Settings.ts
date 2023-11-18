import { darkTheme, lightTheme } from "@/common/data/themes.ts";
import { Theme } from "@mui/material/styles";

export enum Language {
    POLISH = "POLISH",
    ENGLISH = "ENGLISH",
}

export enum LightMode {
    DARK = "DARK",
    LIGHT = "LIGHT",
    // For now light
    COLOR_BLIND = "COLOR_BLIND",
}

export const getThemeForLightMode = (mode: LightMode): Theme => {
    switch (mode) {
        case LightMode.DARK:
            return darkTheme;
        case LightMode.LIGHT:
            return lightTheme;
        case LightMode.COLOR_BLIND:
            // For now light
            // TODO https://mui.com/material-ui/customization/dark-mode/ <--- how to create custom palette
            return lightTheme;
        default:
            return darkTheme;
    }
};
