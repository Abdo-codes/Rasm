

import SwiftUI

public protocol CustomButtonStyle: ButtonStyle {
    var isDisabled: Bool {get  set}
}

// MARK: -  Solid Style
public extension CustomButtonStyle where Self == SolidButtonStyle {
    static func solidStyle(
        backgroundColor: Color,
        onFocusColor: Color,
        disableColor: Color,
        foreground: Color = .white,
        cornerRadius: CGFloat,
        isDisable: Bool
    ) -> SolidButtonStyle {
        SolidButtonStyle(
            backgroundColor: backgroundColor,
            onFocusColor: onFocusColor,
            foreground: foreground, 
            disableColor: disableColor,
            cornerRadius: cornerRadius,
            isDisabled: isDisable
        )
    }
}

// MARK: -  OutLine Style
public extension CustomButtonStyle where Self == OutlineButtonStyle {
    static func outlineStyle(
        foregroundColor: Color,
        onFocusColor: Color,
        borderColor: Color,
        disableColor: Color,
        borderWidth: CGFloat,
        borderType: BorderType = .fixed,
        isDisable: Bool
    ) -> OutlineButtonStyle {
        OutlineButtonStyle(
            foregroundColor: foregroundColor,
            onFocusColor: onFocusColor,
            borderColor: borderColor, 
            disableColor: disableColor,
            borderWidth: borderWidth,
            isDisabled: isDisable, 
            borderType: borderType
        )
    }
}

// MARK: -  Ghost Style
public extension CustomButtonStyle where Self == GhostButtonStyle {
    static func ghostStyle(
        foregroundColor: Color,
        onFocusColor: Color,
        disbaleColor: Color,
        isDisable: Bool
    ) -> GhostButtonStyle {
        GhostButtonStyle(
            foregroundColor: foregroundColor,
            onFocusColor: onFocusColor,
            disbaleColor: disbaleColor,
            isDisabled: isDisable
        )
    }
}



public extension CustomButtonStyle where Self == ShapeButtonStyle  {
    static func shapeBorderStyle(
        shape: ButtonShape,
        style: ButtonStyleType,
        onFocusColor: Color,
        foregroundColor: Color,
        disableColor: Color,
        isDisabled: Bool
    ) -> ShapeButtonStyle {
        ShapeButtonStyle(
            shape: shape,
            style: style,
            onFocusColor: onFocusColor,
            foregroundColor: foregroundColor,
            disableColor: disableColor,
            isDisabled: isDisabled
        )
    }
}
