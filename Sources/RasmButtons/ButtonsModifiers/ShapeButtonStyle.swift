import SwiftUI

public enum ButtonShape: Equatable {
    case circle
    case roundedRectangle(cornerRadius: CGFloat)
    case capsule
    case rectangle
    case ghost
}

public enum ButtonStyleType {
    case fill(Color, disbaledColor: Color)
    case border(Color, disbaledColor: Color,  lineWidth: CGFloat)
    case dottedBorder(Color, disbaledColor: Color, lineWidth: CGFloat, dash: [CGFloat])
    case ghost
}

@available(iOS 13.0, macOS 10.15, *)
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
                .foregroundColor(
                    isDisabled
                        ? disableColor
                    : (configuration.isPressed && shape == .ghost)
                        ? onFocusColor
                        : foregroundColor
                )
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
        case .ghost:
            EmptyView()
        }
    }

    @ViewBuilder
    private func createCircle(isPressed: Bool) -> some View {
            switch style {
            case .fill(let color, let disabledColor):
                Circle()
                    .fill(
                        isDisabled
                        ? disabledColor
                        : (isPressed ? onFocusColor : color)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .border(let color, let disbaledColor, let lineWidth):
                Circle()
                    .stroke(
                        isDisabled ? disbaledColor : (isPressed ? onFocusColor : color),
                        lineWidth: lineWidth
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .dottedBorder(let color, let disbaledColor ,let lineWidth, let dash):
                Circle()
                    .stroke(
                        style: StrokeStyle(lineWidth: lineWidth, dash: dash)
                    )
                    .foregroundColor(isDisabled ? disbaledColor : (isPressed ? onFocusColor : color))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .ghost:
                EmptyView()
            }
    }

    @ViewBuilder
    private func createRoundedRectangle(cornerRadius: CGFloat, isPressed: Bool) -> some View {
        switch style {
        case .fill(let color, let disbaledColor):
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(isDisabled ? disbaledColor : (isPressed ? onFocusColor : color))
        case .border(let color, let disbaledColor ,let lineWidth):
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(isDisabled ? disbaledColor : (isPressed ? onFocusColor : color), lineWidth: lineWidth)
        case .dottedBorder(let color, let disbaledColor ,let lineWidth, let dash):
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dash))
                .foregroundColor(isDisabled ? disbaledColor : (isPressed ? onFocusColor : color))
        case .ghost:
            EmptyView()
        }
    }

    @ViewBuilder
    private func createCapsule(isPressed: Bool) -> some View {
        switch style {
        case .fill(let color, let disbaledColor):
            Capsule().fill(isDisabled ? disbaledColor : (isPressed ? onFocusColor : color))
        case .border(let color, let disbaledColor, let lineWidth):
            Capsule().stroke(isDisabled ? disbaledColor : (isPressed ? onFocusColor : color), lineWidth: lineWidth)
        case .dottedBorder(let color, let disbaledColor, let lineWidth, let dash):
            Capsule().stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dash))
                .foregroundColor(isDisabled ? disbaledColor : (isPressed ? onFocusColor : color))
        case .ghost:
            EmptyView()
        }
    }

    @ViewBuilder
    private func createRectangle(isPressed: Bool) -> some View {
        switch style {
        case .fill(let color, let disbaledColor):
            Rectangle().fill(isDisabled ? disbaledColor : (isPressed ? onFocusColor : color))
        case .border(let color, let disbaledColor, let lineWidth):
            Rectangle().stroke(isDisabled ? disbaledColor : (isPressed ? onFocusColor : color), lineWidth: lineWidth)
        case .dottedBorder(let color, let disbaledColor, let lineWidth, let dash):
            Rectangle().stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dash))
                .foregroundColor(isDisabled ? disbaledColor : (isPressed ? onFocusColor : color))
        case .ghost:
            EmptyView()
        }
    }
}
