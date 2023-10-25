export const getCssPropValue = (element: Element, cssPropertyName: string) =>
    window.getComputedStyle(element, null).getPropertyValue(cssPropertyName);
