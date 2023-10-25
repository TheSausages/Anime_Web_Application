import { CommonActionType } from "@/common/actions/commonActions.ts";
import { CommonState } from "@/common/data/CommonState.ts";
import { ActionInterface } from "@/root/actions/rootAction.ts";
import { defaultState } from "@/root/reducers/rootReducer.ts";

export default function commonReducer(
    state: CommonState = defaultState.common,
    action: ActionInterface,
) {
    switch (action.type) {
        case CommonActionType.CHANGE_LIGHT_MODE: {
            return {
                ...state,
                light_mode: action.payload,
            } as CommonState;
        }

        default:
            return state;
    }
}
