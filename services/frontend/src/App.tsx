import { CompletePostPageDTO } from "@/generated";
import { RootState } from "@/root/data/RootState.ts";
import LightModeSelector from "@/user/components/LightModeSelector.tsx";
import { getThemeSelector } from "@/user/selectors/userSelectors.ts";
import "@fontsource/roboto/300.css";
import "@fontsource/roboto/400.css";
import "@fontsource/roboto/500.css";
import "@fontsource/roboto/700.css";
import { ThemeProvider } from "@mui/material";
import { Theme } from "@mui/material/styles";
import { connect } from "react-redux";

interface MainAppProps {
    light_mode: Theme;
}

function App(props: MainAppProps) {
    let a: CompletePostPageDTO = {
        content: [],
        domainPageType: "completePostPage",
        nrOfElements: 0,
        pageSize: 0,
        pageNumber: 0,
        totalPages: 1,
        last: true,
        empty: true,
    };

    return (
        <ThemeProvider theme={props.light_mode}>
            <LightModeSelector />
            <p>{JSON.stringify(a)}</p>
        </ThemeProvider>
    );
}

const mapStateToProps = (state: RootState) =>
    ({
        light_mode: getThemeSelector(state),
    }) as MainAppProps;

export default connect(mapStateToProps)(App);
