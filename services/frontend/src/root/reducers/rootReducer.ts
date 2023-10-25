import { RootState } from "@/root/data/RootState.ts";
import { Language, LightMode } from "@/user/data/Settings.ts";
import userReducer from "@/user/reducers/userReducer.ts";
import { combineReducers } from "@reduxjs/toolkit";

export const defaultState = {
    user: {
        light_mode: LightMode.LIGHT,
        language: Language.ENGLISH,
    },
    // @ts-ignore TS6133
} as RootState;

export default combineReducers({
    user: userReducer,
});
