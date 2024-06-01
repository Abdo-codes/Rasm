
import SwiftUI

public struct GhostButtonStyle: CustomButtonStyle {
    var foregroundColor: Color
    var onFocusColor: Color
    var disbaleColor: Color
    public var isDisabled: Bool

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundColor(
                isDisabled
                    ? disbaleColor
                    : configuration.isPressed
                    ? onFocusColor
                    : foregroundColor
            )
    }
}
