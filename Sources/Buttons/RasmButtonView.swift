//
//  SolidButton.swift
//  MedicalApp
//
//  Created by MahmoudFares on 14/11/2023.
//

import SwiftUI

public enum ButtonType {
    case normal
    case withImage
    case image

    var hiddenImage: Bool {
        self == .normal
    }

    var hiddenTitle: Bool {
        self == .image
    }
}

public struct RasmButtonView<Style: CustomButtonStyle>: View {
    var type: ButtonType
    var title: String
    var font: Font
    var buttonStyle: Style
    var image: String?
    var isDisable: Bool
    var action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                    .hiddenIf(type.hiddenTitle)
                    .font(font)
                Image(image ?? "")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .hiddenIf(type.hiddenImage)
            }
            .frame(maxWidth: .infinity)
        }
        .disabled(isDisable)
        .buttonStyle(
            buttonStyle
        )
    }
}

#Preview("OutLine") {
    RasmButtonView(
        type: .normal,
        title: "Hit Me",
        font: .body,
        buttonStyle: .outlineStyle(
            foregroundColor: .white, 
            onFocusColor: .blue,
            borderColor: .black,
            borderWidth: 10,
            isDisable: false
        ),
        isDisable: false,
        action: {}
    )
}

#Preview("Solid", body: {
    RasmButtonView(
        type: .withImage,
        title: "Hit Me",
        font: .callout,
        buttonStyle: .solidStyle(
            backgroundColor: .brown,
            onFocusColor: .red,
            foreground: .white,
            cornerRadius: 10,
            isDisable: false
        ),
        image: "logo",
        isDisable: false,
        action: {}
    )
})

#Preview("Ghost", body: {
    RasmButtonView(
        type: .withImage,
        title: "Hit Me",
        font: .caption,
        buttonStyle: .ghostStyle(foregroundColor: .black, onFocusColor: .blue,isDisable: false),
        isDisable: false,
        action: {}
    )
})
