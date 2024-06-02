//
//  SwiftUIView.swift
//  
//
//  Created by MahmoudFares on 01/06/2024.
//

enum TextFieldStyleType {
    case roundedRectangle(cornerRadius: CGFloat, borderColor: Color, borderWidth: CGFloat)
    case rectangle(borderColor: Color, borderWidth: CGFloat)
    case noBorder
    case singleLine(borderColor: Color, borderWidth: CGFloat)
}

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var style: TextFieldStyleType
    var leadingImage: Image? = nil
    var trailingImage: Image? = nil
    var error: Bool = false
    var errorColor: Color = .red
    @FocusState var isFocus: Bool
    var body: some View {
        HStack {
            if let leadingImage = leadingImage {
                leadingImage
                    .foregroundColor(error ? errorColor : .gray)
            }
            TextField(placeholder, text: $text)
                .background(backgroundView)
                .padding(.vertical, 5)
                .focused($isFocus)
            if let trailingImage = trailingImage {
                trailingImage
                    .foregroundColor(
                        (
                            error && !isFocus && !text.isEmpty
                        ) ? errorColor : .gray
                    )
            }
        }
        .padding(.horizontal)
        .overlay(borderView.frame(height: 40))
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
        case .roundedRectangle(let cornerRadius, let borderColor, let borderWidth):
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(error ? errorColor : borderColor, lineWidth: borderWidth)
        case .rectangle(let borderColor, let borderWidth):
            Rectangle()
                .stroke(error ? errorColor : borderColor, lineWidth: borderWidth)
        case .noBorder:
            EmptyView()
        case .singleLine(let borderColor, let borderWidth):
            VStack {
                Spacer()
                Rectangle()
                    .fill(error ? errorColor : borderColor)
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
        CustomTextField(
            text: $textField1,
            placeholder: "Rounded Rectangle",
            style: .roundedRectangle(cornerRadius: 10, borderColor: .blue, borderWidth: 2),
            leadingImage: Image(systemName: "magnifyingglass")
        )
        
        CustomTextField(
            text: $textField2,
            placeholder: "Rectangle",
            style: .rectangle(borderColor: .green, borderWidth: 2)
        )
        
        CustomTextField(
            text: $textField3,
            placeholder: "No Border",
            style: .noBorder,
            leadingImage: Image(systemName: "magnifyingglass"),
            trailingImage: Image(systemName: "magnifyingglass")
        )
        
        CustomTextField(
            text: $textField4,
            placeholder: "Single Line",
            style: .singleLine(borderColor: .gray, borderWidth: 2)
        )
        
        CustomTextField(
            text: $textField5,
            placeholder: "With Error",
            style: .rectangle(borderColor: .gray, borderWidth: 2),
            error: hasError,
            errorColor: .red
        )
        
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
