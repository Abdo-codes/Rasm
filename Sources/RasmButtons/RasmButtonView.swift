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

public struct RasmButtonViewState<Style: CustomButtonStyle> {
    var type: ButtonType
    var title: String
    var font: Font
    var buttonStyle: Style
    var image: String?
    var action: () -> Void
    public init(
        type: ButtonType,
        title: String,
        font: Font,
        buttonStyle: Style,
        image: String? = nil,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.title = title
        self.font = font
        self.buttonStyle = buttonStyle
        self.image = image
        self.action = action
    }
}

public struct RasmButtonView<Style: CustomButtonStyle>: View {
    public init(viewState: RasmButtonViewState<Style>) {
        self.viewState = viewState
    }
    
    var viewState: RasmButtonViewState<Style>
    
    public var body: some View {
        Button {
            viewState.action()
        } label: {
            HStack {
                Text(viewState.title)
                    .hiddenIf(viewState.type.hiddenTitle)
                    .font(viewState.font)
                Image(viewState.image ?? "")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .hiddenIf(viewState.type.hiddenImage)
            }
            .frame(maxWidth: .infinity)
        }
        .disabled(viewState.buttonStyle.isDisabled)
        .buttonStyle(
            viewState.buttonStyle
        )
    }
}

#Preview("OutLine") {
    RasmButtonView(
        viewState: .init(
            type: .normal,
            title: "Hit Me",
            font: .body,
            buttonStyle: .outlineStyle(
                foregroundColor: .white,
                onFocusColor: .blue,
                borderColor: .black, 
                disableColor: .gray.opacity(0.2),
                borderWidth: 10,
                isDisable: false
            ),
            action: {}
        )
    )
}

#Preview("Solid", body: {
    RasmButtonView(
        viewState: .init(
            type: .withImage,
            title: "Hit Me",
            font: .callout,
            buttonStyle: .solidStyle(
                backgroundColor: .brown,
                onFocusColor: .red,
                disableColor: .gray,
                foreground: .white,
                cornerRadius: 10,
                isDisable: false
            ),
            image: "logo",
            action: {}

        )
    )
})

#Preview("Ghost",
         body: {
    RasmButtonView(
        viewState: .init(
            type: .withImage,
            title: "Hit Me",
            font: .caption,
            buttonStyle: .ghostStyle(
                foregroundColor: .black,
                onFocusColor: .blue,
                disbaleColor: .gray.opacity(0.2),
                isDisable: false
            ),
            action: {
            }

        )
    )
})
