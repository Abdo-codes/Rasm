//
//  SolidButtonModifiers.swift
//  MedicalApp
//
//  Created by MahmoudFares on 14/11/2023.
//

import SwiftUI

public struct SolidButtonStyle: CustomButtonStyle {
    var backgroundColor: Color
    var onFocusColor: Color
    var foreground: Color
    var disableColor: Color
    var cornerRadius: CGFloat
    public var isDisabled: Bool

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundColor(foreground)
            .background(
                isDisabled
                    ? disableColor
                    : configuration.isPressed
                    ? onFocusColor
                    : backgroundColor
            )
            .cornerRadius(cornerRadius)
    }
}
