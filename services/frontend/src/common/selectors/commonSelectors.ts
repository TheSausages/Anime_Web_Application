import { getThemeForLightMode } from "@/common/data/Settings.ts";
import { RootState } from "@/root/data/RootState.ts";

export const getThemeEnumSelector = (state: RootState) =>
    state.common.light_mode;
export const getThemeSelector = (state: RootState) =>
    getThemeForLightMode(getThemeEnumSelector(state));
