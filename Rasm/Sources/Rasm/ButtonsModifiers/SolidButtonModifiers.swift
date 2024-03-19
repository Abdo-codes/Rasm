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
    var cornerRadius: CGFloat
    var isDisable: Bool

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundColor(foreground)
            .background(
                isDisable
                    ? Color.gray
                    : configuration.isPressed
                    ? onFocusColor
                    : backgroundColor
            )
            .cornerRadius(cornerRadius)
    }
}
