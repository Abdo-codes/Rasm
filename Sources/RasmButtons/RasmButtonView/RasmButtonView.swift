//
//  SolidButton.swift
//  MedicalApp
//
//  Created by MahmoudFares on 14/11/2023.
//

import SwiftUI
import RasmModifiers

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
    var image: Image?
    var imageWidth: CGFloat
    var action: () -> Void
    public init(
        type: ButtonType,
        title: String,
        font: Font,
        buttonStyle: Style,
        image: Image? = nil,
        imageWidth: CGFloat = 20,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.title = title
        self.font = font
        self.buttonStyle = buttonStyle
        self.image = image
        self.imageWidth = imageWidth
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
                    .minimumScaleFactor(0.50)
                if let image = viewState.image {
                    image
                    .resizable()
                    .frame(width: viewState.imageWidth, height: viewState.imageWidth)
                    .hiddenIf(viewState.type.hiddenImage)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .disabled(viewState.buttonStyle.isDisabled)
        .buttonStyle(
            viewState.buttonStyle
        )
    }
}
