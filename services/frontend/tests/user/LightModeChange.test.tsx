import { getCssPropValue } from "#root/tests/util/utils.ts";
import { LightMode } from "@/common/data/Settings.ts";
import { darkTheme } from "@/common/data/themes.ts";
import { store } from "@/root/components/store.ts";
import { act, render, within } from "@testing-library/react";
import { userEvent } from "@testing-library/user-event";
import { Provider } from "react-redux";
import { expect, test } from "vitest";
import App from "../../src/App.tsx";

test("Change Light Mode to Dark", async () => {
    // Given
    const app = render(
        <Provider store={store}>
            <App />
        </Provider>,
    );

    // When
    await act(async () => {
        await userEvent.click(
            app.container.querySelector("#theme-selector-dropdown")!,
        );
    });
    const lightModes = within(app.getByRole("listbox"));
    await act(async () => {
        await userEvent.click(lightModes.getByText(`${LightMode.DARK}`));
    });

    // Then
    const appBar = app.container.querySelector("#app-bar-bar")!;
    expect(getCssPropValue(appBar, "background-color")).toBe(
        darkTheme.palette.background.default,
    );
});
