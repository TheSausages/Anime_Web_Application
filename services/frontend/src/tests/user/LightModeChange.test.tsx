import App from "@/App.tsx";
import { store } from "@/root/components/store.ts";
import { LightMode } from "@/user/data/Settings.ts";
import { render } from "@testing-library/react";
import { fireEvent, within } from "@testing-library/vue";
import { Provider } from "react-redux";
import { expect, test } from "vitest";

test("Change Light Mode to Dark", async () => {
    // Given
    const app = render(
        <Provider store={store}>
            <App />
        </Provider>,
    );

    // When
    await fireEvent.mouseDown(
        app.container.querySelector("#theme-selector-dropdown")!,
    );

    const lightModes = within(app.getByRole("listbox"));
    fireEvent.click(lightModes.getByText(`${LightMode.DARK}`));

    // Then
    const selectLabel = app.container.querySelector("#theme-selector-label")!;
    expect(
        window
            .getComputedStyle(selectLabel, null)
            .getPropertyValue("background-color"),
    ).toBe("#121212");
});
