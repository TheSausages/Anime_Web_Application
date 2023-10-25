import LightModeSelector from "@/common/components/lightMode/LightModeSelector.tsx";
import { RootState } from "@/root/data/RootState.ts";
import {
    AppBar,
    Box,
    Container,
    ContainerProps,
    Link,
    Toolbar,
    Typography,
    TypographyProps,
} from "@mui/material";
import { styled } from "@mui/material/styles";
import { ConnectedProps, connect } from "react-redux";

const mapStateToProps = (_state: RootState) => ({});
const mapDispatchToProps = {};

const connector = connect(mapStateToProps, mapDispatchToProps);

type AppBarProps = ConnectedProps<typeof connector> & {};

const StyledTitleTypography = styled(Typography)<TypographyProps>(
    ({ theme }) => ({
        margin: "2px",
        marginRight: "20px",
        fontWeight: 700,
        letterSpacing: ".3rem",
        textDecoration: "none",
        boxShadow: "none",
        color: theme.palette.text.primary,
    }),
);

const StyledMenuItemTypography = styled(Typography)<TypographyProps>(
    ({ theme }) => ({
        margin: "20px",
        fontWeight: 600,
        letterSpacing: ".1rem",
        textDecoration: "none",
        boxShadow: "none",
        color: theme.palette.text.primary,
    }),
);

const StyledAppBar = styled(AppBar)<AppBarProps>(({ theme }) => ({
    backgroundColor: theme.palette.background.default,
}));

const StyledAppBarContainer = styled(Container)<ContainerProps>(({}) => ({
    maxWidth: "none",
    ["@media (min-width: 900px)"]: {
        maxWidth: "none",
    },
}));

function AppBarComponent(_props: AppBarProps) {
    // https://mui.com/material-ui/react-app-bar/
    return (
        <StyledAppBar position="static" id="app-bar-bar">
            <StyledAppBarContainer maxWidth="xl">
                <Toolbar disableGutters>
                    <StyledTitleTypography
                        variant="h5"
                        noWrap
                        component={Link}
                        // @ts-ignore
                        to="http://localhost:5173/"
                    >
                        ANIMEAPP
                    </StyledTitleTypography>

                    <Box
                        sx={{
                            flexGrow: 1,
                            display: { xs: "none", md: "flex" },
                        }}
                    >
                        {["X1", "X2"].map((menuItem: string) => (
                            <StyledMenuItemTypography
                                variant={"h6"}
                                key={menuItem}
                            >
                                {menuItem}
                            </StyledMenuItemTypography>
                        ))}
                    </Box>

                    <Box sx={{ flexGrow: 0 }}>
                        <LightModeSelector />
                    </Box>
                </Toolbar>
            </StyledAppBarContainer>
        </StyledAppBar>
    );
}

export default AppBarComponent;
