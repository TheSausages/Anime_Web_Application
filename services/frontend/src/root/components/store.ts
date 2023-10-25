import { configureStore } from "@reduxjs/toolkit";
import { TypedUseSelectorHook, useDispatch, useSelector } from "react-redux";
import reducer from "../reducers/rootReducer.ts";

export const store = configureStore({
    reducer: reducer,
});

export type RootState = ReturnType<typeof store.getState>;
export type RootDispatch = typeof store.dispatch;

export type DispatchFunc = () => RootDispatch;
export const useTypedDispatch: DispatchFunc = useDispatch;
export const useTypedSelector: TypedUseSelectorHook<RootState> = useSelector;
