import { RootState } from "@/root/data/RootState.ts";
import { UserActionType } from "@/user/actions/userActions.ts";
import { LightMode } from "@/user/data/Settings.ts";
import { getThemeEnumSelector } from "@/user/selectors/userSelectors.ts";
import {
    FormControl,
    InputLabel,
    MenuItem,
    Select,
    SelectChangeEvent
} from "@mui/material";
import { ConnectedProps, connect } from "react-redux";

const mapStateToProps = (state: RootState) => ({
    light_mode: getThemeEnumSelector(state),
});

const mapDispatchToProps = {
    change_light_mode: (light_mode: LightMode) => ({
        type: UserActionType.CHANGE_LIGHT_MODE,
        payload: light_mode,
    }),
};

const connector = connect(mapStateToProps, mapDispatchToProps);

type LightModeSelectorProps = ConnectedProps<typeof connector> & {};

export function LightModeSelectorComponent(props: LightModeSelectorProps) {
    const handleLightModeChange = (
        event: SelectChangeEvent<LightMode>,
    ): void => {
        props.change_light_mode(event.target.value as LightMode);
    };

    // Box for visual tests, can be deleted!
    return (
     <>
         <FormControl>
             <InputLabel id="theme-selector-label">
                 Theme
             </InputLabel>
             <Select
                 labelId="theme-selector-label"
                 id="theme-selector-dropdown"
                 value={props.light_mode}
                 label="Theme"
                 onChange={handleLightModeChange}
             >
                 {(Object.keys(LightMode).map((value: string) => (
                     <MenuItem
                         id={`theme-selector-${value}`}
                         key={value}
                         value={value}
                     >
                         {value}
                     </MenuItem>
                 )))}
             </Select>
         </FormControl>
     </>
    );
};

export default connect(
    mapStateToProps,
    mapDispatchToProps,
)(LightModeSelectorComponent);
