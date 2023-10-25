import { RootState } from "@/root/data/RootState.ts";
import { getThemeForLightMode } from "@/user/data/Settings.ts";

export const getThemeEnumSelector = (state: RootState) => state.user.light_mode;
export const getThemeSelector = (state: RootState) =>
    getThemeForLightMode(getThemeEnumSelector(state));
