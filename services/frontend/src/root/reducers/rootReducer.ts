import { Language, LightMode } from "@/common/data/Settings.ts";
import commonReducer from "@/common/reducers/commonReducer.ts";
import { RootState } from "@/root/data/RootState.ts";
import { combineReducers } from "@reduxjs/toolkit";

export const defaultState = {
    common: {
        light_mode: LightMode.LIGHT,
        language: Language.ENGLISH,
    },
    // @ts-ignore TS6133
} as RootState;

export default combineReducers({
    common: commonReducer,
});
