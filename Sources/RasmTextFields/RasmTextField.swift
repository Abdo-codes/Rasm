//
//  SwiftUIView.swift
//  
//
//  Created by MahmoudFares on 01/06/2024.
//

import SwiftUI
import RasmModifiers

public enum TextFieldStyleType {
    case roundedRectangle(cornerRadius: CGFloat, borderColor: Color, borderInActiveColor: Color, borderWidth: CGFloat)
    case rectangle(borderColor: Color, borderWidth: CGFloat)
    case noBorder
    case singleLine(borderColor: Color, borderWidth: CGFloat)
}

public struct RasmTextField: View {
    @Binding var text: String
    var placeholder: String
    var style: TextFieldStyleType
    var leadingImage: Image?
    var trailingImage: Image?
    var error: Bool
    var errorMessage: String?
    var errorColor: Color
    var font: Font
    var height: CGFloat
    var disableColor: Color
    var isDisable: Bool
    var isSecure: Bool
    var placeholderColor: Color
    var leadingAction: (() -> Void)?
    var trailingAction: (() -> Void)?
    var showError: Bool {
        (
            !isFocus
            && error
            && errorMessage != nil
            && !text.isEmpty
        )
    }
    @FocusState private var isFocus: Bool

    public init(
        text: Binding<String>,
        placeholder: String,
        style: TextFieldStyleType,
        leadingImage: Image? = nil,
        trailingImage: Image? = nil,
        error: Bool = false,
        errorMessage: String? = nil,
        errorColor: Color = .red,
        font: Font,
        height: CGFloat = 45,
        disableColor: Color = .gray,
        isDisable: Bool = false,
        isSecure: Bool = false,
        placeholderColor: Color = .gray,
        leadingAction: (() -> Void)? = nil,
        trailingAction: (() -> Void)? = nil
    ) {
        self._text = text
        self.placeholder = placeholder
        self.style = style
        self.leadingImage = leadingImage
        self.trailingImage = trailingImage
        self.error = error
        self.errorMessage = errorMessage
        self.errorColor = errorColor
        self.font = font
        self.height = height
        self.disableColor = disableColor
        self.isDisable = isDisable
        self.isSecure = isSecure
        self.placeholderColor = placeholderColor
        self.leadingAction = leadingAction
        self.trailingAction = trailingAction
    }

    public var body: some View {
        VStack(spacing: 13) {
            HStack {
                if let leadingImage = leadingImage {
                    Button {
                        leadingAction?()
                    } label: {
                        leadingImage
                    }
                    .disabled(leadingAction == nil)
                }
                if isSecure {
                    SecureField(
                        "",
                        text: $text,
                        prompt: Text(placeholder)
                            .foregroundColor(placeholderColor)
                            .font(font)
                    )
                        .font(font)
                        .frame(height: height)
                        .focused($isFocus)
                        .background(backgroundView)
                }else {
                    TextField(
                        "",
                        text: $text,
                        prompt: Text(placeholder)
                            .foregroundColor(placeholderColor)
                            .font(font)
                    )
                        .font(font)
                        .frame(height: height)
                        .focused($isFocus)
                        .background(backgroundView)
                }
                if let trailingImage = trailingImage {
                    Button {
                        trailingAction?()
                    } label: {
                        trailingImage
                    }
                    .disabled(trailingAction == nil)
                }
            }
            .padding(.horizontal)
            .disabled(isDisable)
            .overlay(borderView)
            if showError {
                Text(errorMessage ?? "")
                    .foregroundStyle(errorColor)
                    .font(font)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .noBorder:
            Color.clear
        default:
            Color.clear
        }
    }

    @ViewBuilder
    private var borderView: some View {
        switch style {
        case .roundedRectangle(let cornerRadius, let borderColor, let borderInActiveColor, let borderWidth):
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    (error && !isFocus && !text.isEmpty) ? errorColor : isFocus ? borderColor : borderInActiveColor,
                    lineWidth: borderWidth
                )
                .frame(height: height)
                .background(isDisable ? disableColor.cornerRadius(cornerRadius) : Color.clear.cornerRadius(cornerRadius))
        case .rectangle(let borderColor, let borderWidth):
            Rectangle()
                .stroke(
                    (error && !isFocus && !text.isEmpty) ? errorColor : borderColor,
                    lineWidth: borderWidth
                )
                .frame(height: height)
        case .noBorder:
            EmptyView()
        case .singleLine(let borderColor, let borderWidth):
            VStack {
                Spacer()
                Rectangle()
                    .fill(
                        (error && !isFocus && !text.isEmpty) ? errorColor : borderColor
                    )
                    .frame(height: borderWidth)
            }
            .frame(height: height)
        }
    }
}


#Preview {
    @State  var textField1: String = ""
    @State  var textField2: String = ""
    @State  var textField3: String = ""
    @State  var textField4: String = ""
    @State  var textField5: String = ""
    @State  var hasError: Bool = true

   return  VStack(spacing: 0) {
        RasmTextField(
            text: $textField1,
            placeholder: "Rounded Rectangle",
            style: .roundedRectangle(cornerRadius: 10, borderColor: .blue, borderInActiveColor: .gray, borderWidth: 2),
            leadingImage: Image(systemName: "magnifyingglass"),
            error: true,
            font: .footnote,
            leadingAction: { print("Hello")}
        )
        
        RasmTextField(
            text: $textField2,
            placeholder: "Rectangle",
            style: .rectangle(borderColor: .green, borderWidth: 2),
            font: .footnote
        )
        
        RasmTextField(
            text: $textField3,
            placeholder: "No Border",
            style: .noBorder,
            leadingImage: Image(systemName: "magnifyingglass"),
            trailingImage: Image(systemName: "magnifyingglass"),
            font: .footnote
        )
        
        RasmTextField(
            text: $textField4,
            placeholder: "Single Line",
            style: .singleLine(borderColor: .gray, borderWidth: 2),
            font: .footnote
        )
        
        RasmTextField(
            text: $textField5,
            placeholder: "With Error",
            style: .rectangle(borderColor: .gray, borderWidth: 2),
            error: true,
            errorColor: .red,
            font: .footnote
        )
       FloatingLabelTextField(placeholder: "swswswswsw")
        Button("Toggle Error") {
            hasError.toggle()
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
    .padding()

}
struct FloatingLabelTextField: View {
    @State private var text: String = ""
    @State private var isEditing: Bool = false
    @FocusState private var isFocus: Bool
    var placeholder: String

    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .foregroundColor(isEditing || !text.isEmpty ? .accentColor : .gray)
                .background(Color.white)
                .offset(y: isEditing || !text.isEmpty ? -25 : 0)
                .scaleEffect(isEditing || !text.isEmpty ? 0.8 : 1, anchor: .leading)
                .padding([.horizontal, .bottom], isFocus ? 10 : 0)
            TextField("", text: $text, onEditingChanged: { editing in
                withAnimation {
                    isEditing = editing
                }
            })
            .padding(.top, isEditing || !text.isEmpty ? 15 : 0)
            .padding(.horizontal)
            .focused($isFocus)
        }
        .padding(.top, 15)
        .padding(.bottom, 8)
        .background(
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                         .gray,
                    lineWidth: 1)
            }
        )
        .padding(.horizontal)
    }
}
