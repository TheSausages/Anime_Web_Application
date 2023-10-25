import { UserActionType } from "@/user/actions/userActions.ts";
import { Action } from "@reduxjs/toolkit";

export interface ActionInterface extends Action<UserActionType> {
    payload?: unknown;
}
