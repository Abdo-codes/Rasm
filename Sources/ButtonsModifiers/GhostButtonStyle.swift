//
//  GhostButtonStyle.swift
//  MedicalApp
//
//  Created by MahmoudFares on 14/11/2023.
//

import SwiftUI

public struct GhostButtonStyle: CustomButtonStyle {
    var foregroundColor: Color
    var onFocusColor: Color
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
    }
}
