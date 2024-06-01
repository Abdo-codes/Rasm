import SwiftUI

public enum ButtonShape {
    case circle
    case roundedRectangle(cornerRadius: CGFloat)
    case capsule
    case rectangle
}

public enum ButtonStyleType {
    case fill(Color)
    case border(Color, lineWidth: CGFloat)
    case dottedBorder(Color, lineWidth: CGFloat, dash: [CGFloat])
}

public struct ShapeButtonStyle: CustomButtonStyle {
    public var isDisabled: Bool
    var shape: ButtonShape
    var style: ButtonStyleType
    var onFocusColor: Color
    var foregroundColor: Color
    var disableColor: Color
    
    public init(
        shape: ButtonShape,
        style: ButtonStyleType,
        onFocusColor: Color,
        foregroundColor: Color,
        disableColor: Color,
        isDisabled: Bool
    ) {
        self.shape = shape
        self.style = style
        self.onFocusColor = onFocusColor
        self.foregroundColor = foregroundColor
        self.disableColor = disableColor
        self.isDisabled = isDisabled
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            backgroundView(isPressed: configuration.isPressed)
            configuration.label
                .padding(10)
                .disabled(isDisabled)
                .animation(.easeInOut, value: configuration.isPressed)
        }
        .foregroundColor(isDisabled ? disableColor : foregroundColor)
    }
    
    @ViewBuilder
    private func backgroundView(isPressed: Bool) -> some View {
        switch shape {
        case .circle:
            createCircle(isPressed: isPressed)
        case .roundedRectangle(let cornerRadius):
            createRoundedRectangle(cornerRadius: cornerRadius, isPressed: isPressed)
        case .capsule:
            createCapsule(isPressed: isPressed)
        case .rectangle:
            createRectangle(isPressed: isPressed)
        }
    }

    @ViewBuilder
    private func createCircle(isPressed: Bool) -> some View {
            switch style {
            case .fill(let color):
                Circle()
                    .fill(
                        isDisabled
                        ? disableColor
                        : (isPressed ? onFocusColor : color)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .border(let color, let lineWidth):
                Circle()
                    .stroke(
                        isDisabled ? disableColor : (isPressed ? onFocusColor : color),
                        lineWidth: lineWidth
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .dottedBorder(let color, let lineWidth, let dash):
                Circle()
                    .stroke(
                        style: StrokeStyle(lineWidth: lineWidth, dash: dash)
                    )
                    .foregroundColor(isDisabled ? disableColor : (isPressed ? onFocusColor : color))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
    }

    @ViewBuilder
    private func createRoundedRectangle(cornerRadius: CGFloat, isPressed: Bool) -> some View {
        switch style {
        case .fill(let color):
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(isDisabled ? disableColor : (isPressed ? onFocusColor : color))
        case .border(let color, let lineWidth):
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(isDisabled ? disableColor : (isPressed ? onFocusColor : color), lineWidth: lineWidth)
        case .dottedBorder(let color, let lineWidth, let dash):
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dash))
                .foregroundColor(isDisabled ? disableColor : (isPressed ? onFocusColor : color))
        }
    }

    @ViewBuilder
    private func createCapsule(isPressed: Bool) -> some View {
        switch style {
        case .fill(let color):
            Capsule().fill(isDisabled ? disableColor : (isPressed ? onFocusColor : color))
        case .border(let color, let lineWidth):
            Capsule().stroke(isDisabled ? disableColor : (isPressed ? onFocusColor : color), lineWidth: lineWidth)
        case .dottedBorder(let color, let lineWidth, let dash):
            Capsule().stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dash))
                .foregroundColor(isDisabled ? disableColor : (isPressed ? onFocusColor : color))
        }
    }

    @ViewBuilder
    private func createRectangle(isPressed: Bool) -> some View {
        switch style {
        case .fill(let color):
            Rectangle().fill(isDisabled ? color.opacity(0.5) : (isPressed ? onFocusColor : color))
        case .border(let color, let lineWidth):
            Rectangle().stroke(isDisabled ? color.opacity(0.5) : (isPressed ? onFocusColor : color), lineWidth: lineWidth)
        case .dottedBorder(let color, let lineWidth, let dash):
            Rectangle().stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dash))
                .foregroundColor(isDisabled ? color.opacity(0.5) : (isPressed ? onFocusColor : color))
        }
    }
}
