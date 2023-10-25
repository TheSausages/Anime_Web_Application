import { ActionInterface } from "@/root/actions/rootAction.ts";
import { defaultState } from "@/root/reducers/rootReducer.ts";
import { UserActionType } from "@/user/actions/userActions.ts";
import { UserState } from "@/user/data/UserState.ts";

export default function userReducer(
    state: UserState = defaultState.user,
    action: ActionInterface,
) {
    switch (action.type) {
        case UserActionType.CHANGE_LIGHT_MODE: {
            return {
                ...state,
                light_mode: action.payload,
            } as UserState;
        }

        default:
            return state;
    }
}
