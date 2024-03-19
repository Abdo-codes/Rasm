//
//  OutlineButtonStyle.swift
//  MedicalApp
//
//  Created by MahmoudFares on 14/11/2023.
//

import SwiftUI

public struct OutlineButtonStyle: CustomButtonStyle {
    var foregroundColor: Color
    var onFocusColor: Color
    var borderColor: Color
    var borderWidth: CGFloat
    var isDisable: Bool

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundColor(
                isDisable
                    ? Color.gray
                    : configuration.isPressed
                    ? onFocusColor
                    : foregroundColor
            )
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(
                        configuration.isPressed
                        ? onFocusColor
                        : borderColor,
                        lineWidth: borderWidth
                    )
            )
    }
}
