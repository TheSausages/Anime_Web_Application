import { CommonActionType } from "@/common/actions/commonActions.ts";
import { Action } from "@reduxjs/toolkit";

export interface ActionInterface extends Action<CommonActionType> {
    payload?: unknown;
}
