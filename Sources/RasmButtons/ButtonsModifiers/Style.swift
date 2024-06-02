

import SwiftUI

public protocol CustomButtonStyle: ButtonStyle {
    var isDisabled: Bool {get  set}
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
