//
//  SwiftUIView.swift
//  
//
//  Created by MahmoudFares on 01/06/2024.
//

public enum TextFieldStyleType {
    case roundedRectangle(cornerRadius: CGFloat, borderColor: Color, borderInActiveColor: Color ,borderWidth: CGFloat)
    case rectangle(borderColor: Color, borderWidth: CGFloat)
    case noBorder
    case singleLine(borderColor: Color, borderWidth: CGFloat)
}

import SwiftUI
import RasmModifiers

public struct RasmTextField: View {
    @Binding var text: String
    var placeholder: String
    var style: TextFieldStyleType
    var leadingImage: Image? = nil
    var trailingImage: Image? = nil
    var error: Bool = false
    var errorMessage: String?
    var errorColor: Color = .red
    var font: Font
    @FocusState var isFocus: Bool
    var hiddenError: Bool {
        (isFocus && error && errorMessage != nil)
    }
    public init(
        text: Binding<String>,
        placeholder: String,
        style: TextFieldStyleType,
        leadingImage: Image? = nil,
        trailingImage: Image? = nil,
        error: Bool = false,
        errorMessage: String? = nil,
        errorColor: Color = .red,
        font: Font
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
    }
    public var body: some View {
        VStack(spacing: 13) {
            HStack {
                if let leadingImage = leadingImage {
                    leadingImage
                }
                TextField(placeholder, text: $text)
                    .background(backgroundView)
                    .padding(.vertical, 5)
                    .focused($isFocus)
                    .font(font)
                if let trailingImage = trailingImage {
                    trailingImage
                }
            }
            .padding(.horizontal)
            .overlay(borderView.frame(height: 48))
            Text(errorMessage ?? "")
                .foregroundStyle(errorColor)
                .font(font)
                .hiddenIf(hiddenError)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .noBorder:
            Color.clear
        default:
            Color.white
        }
    }
    
    @ViewBuilder
    private var borderView: some View {
        switch style {
        case .roundedRectangle(let cornerRadius, let borderColor, let borderInActiveColor, let borderWidth):
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(
                    (
                        error && !isFocus && !text.isEmpty
                    ) ? errorColor : isFocus ? borderColor : borderInActiveColor,
                    lineWidth: borderWidth
                )
        case .rectangle(let borderColor, let borderWidth):
            Rectangle()
                .stroke(
                    (
                        error && !isFocus && !text.isEmpty
                    ) ? errorColor : borderColor,
                    lineWidth: borderWidth
                )
        case .noBorder:
            EmptyView()
        case .singleLine(let borderColor, let borderWidth):
            VStack {
                Spacer()
                Rectangle()
                    .fill(
                        (
                            error && !isFocus && !text.isEmpty
                        ) ? errorColor : borderColor
                    )
                    .frame(height: borderWidth)
            }
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

   return  VStack(spacing: 20) {
        RasmTextField(
            text: $textField1,
            placeholder: "Rounded Rectangle",
            style: .roundedRectangle(cornerRadius: 10, borderColor: .blue, borderInActiveColor: .gray, borderWidth: 2),
            leadingImage: Image(systemName: "magnifyingglass"),
            error: true,
            font: .footnote
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
