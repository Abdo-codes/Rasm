
import SwiftUI
public enum BorderType {
    case fixed
    case dashed(CGFloat)
}

public struct OutlineButtonStyle: CustomButtonStyle {
    var foregroundColor: Color
    var onFocusColor: Color
    var borderColor: Color
    var disableColor: Color
    var borderWidth: CGFloat
    public var isDisabled: Bool
    var borderType: BorderType

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundColor(
                isDisabled
                    ? disableColor
                    : configuration.isPressed
                    ? onFocusColor
                    : foregroundColor
            )
            .background(
                BorderView(
                    borderWidth: borderWidth,
                    borderColor: borderColor,
                    onFocusColor: onFocusColor,
                    isPressed: configuration.isPressed,
                    borderType: borderType
                )
            )
    }
}

public struct BorderView: View {
    var borderWidth: CGFloat
    var borderColor: Color
    var onFocusColor: Color
    var isPressed: Bool
    var borderType: BorderType

    public var body: some View {
        switch borderType {
        case .fixed:
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(
                    isPressed
                        ? onFocusColor
                        : borderColor,
                    lineWidth: borderWidth
                )
        case let .dashed(dash):
            RoundedRectangle(cornerRadius: 10)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: borderWidth,
                        dash: [dash]
                    )
                )
                .foregroundColor(borderColor)
        }
    }
}
