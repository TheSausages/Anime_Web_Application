import AppBar from "@/common/components/appBar/AppBar.tsx";
import { getThemeSelector } from "@/common/selectors/commonSelectors.ts";
import { CompletePostPageDTO } from "@/generated";
import { RootState } from "@/root/data/RootState.ts";
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
            <AppBar />
            <p>{JSON.stringify(a)}</p>
            {[...Array(50).keys()].map((value) => (
                <p key={value}>{value}</p>
            ))}
        </ThemeProvider>
    );
}

const mapStateToProps = (state: RootState) =>
    ({
        light_mode: getThemeSelector(state),
    }) as MainAppProps;

export default connect(mapStateToProps)(App);
