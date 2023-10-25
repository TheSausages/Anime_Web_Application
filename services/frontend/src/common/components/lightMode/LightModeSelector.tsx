import { CommonActionType } from "@/common/actions/commonActions.ts";
import { LightMode } from "@/common/data/Settings.ts";
import { getThemeEnumSelector } from "@/common/selectors/commonSelectors.ts";
import { RootState } from "@/root/data/RootState.ts";
import {
    FormControl,
    InputBase,
    InputBaseProps,
    MenuItem,
    Select,
    SelectChangeEvent,
} from "@mui/material";
import { styled } from "@mui/material/styles";
import { ConnectedProps, connect } from "react-redux";

const mapStateToProps = (state: RootState) => ({
    light_mode: getThemeEnumSelector(state),
});

const mapDispatchToProps = {
    change_light_mode: (light_mode: LightMode) => ({
        type: CommonActionType.CHANGE_LIGHT_MODE,
        payload: light_mode,
    }),
};

const connector = connect(mapStateToProps, mapDispatchToProps);

type LightModeSelectorProps = ConnectedProps<typeof connector> & {};

const StyledSelectInput = styled(InputBase)<InputBaseProps>(({}) => ({
    backgroundColor: "transparent",
    textAlign: "center",
    "& .MuiInputBase-input": {
        paddingRight: "0px !important",
    },
}));

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
                <Select
                    id="theme-selector-dropdown"
                    value={props.light_mode}
                    label="Theme"
                    onChange={handleLightModeChange}
                    input={<StyledSelectInput />}
                    inputProps={{ IconComponent: () => null }}
                >
                    {Object.keys(LightMode).map((value: string) => (
                        <MenuItem
                            id={`theme-selector-${value}`}
                            key={value}
                            value={value}
                        >
                            {value}
                        </MenuItem>
                    ))}
                </Select>
            </FormControl>
        </>
    );
}

export default connect(
    mapStateToProps,
    mapDispatchToProps,
)(LightModeSelectorComponent);
