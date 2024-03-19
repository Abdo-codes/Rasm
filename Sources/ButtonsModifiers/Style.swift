//
//  Style.swift
//  MedicalApp
//
//  Created by MahmoudFares on 14/11/2023.
//

import SwiftUI

public protocol CustomButtonStyle: ButtonStyle {}

// MARK: -  Solid Style
public extension CustomButtonStyle where Self == SolidButtonStyle {
    public static func solidStyle(
        backgroundColor: Color,
        onFocusColor: Color,
        foreground: Color = .white,
        cornerRadius: CGFloat,
        isDisable: Bool
    ) -> SolidButtonStyle {
        SolidButtonStyle(
            backgroundColor: backgroundColor,
            onFocusColor: onFocusColor,
            foreground: foreground,
            cornerRadius: cornerRadius,
            isDisable: isDisable
        )
    }
}

// MARK: -  OutLine Style
public extension CustomButtonStyle where Self == OutlineButtonStyle {
    static func outlineStyle(
        foregroundColor: Color,
        onFocusColor: Color,
        borderColor: Color,
        borderWidth: CGFloat,
        isDisable: Bool
    ) -> OutlineButtonStyle {
        OutlineButtonStyle(
            foregroundColor: foregroundColor,
            onFocusColor: onFocusColor,
            borderColor: borderColor,
            borderWidth: borderWidth,
            isDisable: isDisable
        )
    }
}

// MARK: -  Ghost Style
public extension CustomButtonStyle where Self == GhostButtonStyle {
    static func ghostStyle(
        foregroundColor: Color,
        onFocusColor: Color,
        isDisable: Bool
    ) -> GhostButtonStyle {
        GhostButtonStyle(
            foregroundColor: foregroundColor,
            onFocusColor: onFocusColor,
            isDisable: isDisable
        )
    }
}
