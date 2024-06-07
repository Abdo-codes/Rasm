//
//  TextFieldsView.swift
//  Rasm_Example
//
//  Created by MahmoudFares on 02/06/2024.
//  Copyright © 2024 Fares. All rights reserved.
//

import SwiftUI
import RasmTextFields

struct TextFieldsView: View {
    @State  var textField1: String = ""
    @State  var textField2: String = ""
    @State  var textField3: String = ""
    @State  var textField4: String = ""
    @State  var textField5: String = ""
    @State  var hasError: Bool = true

    var body: some View {
        VStack(spacing: 20) {
             RasmTextField(
                 text: $textField1,
                 placeholder: "Rounded Rectangle",
                 style: .roundedRectangle(cornerRadius: 10, borderColor: .blue, borderInActiveColor: .gray, borderWidth: 2),
                 leadingImage: Image(systemName: "magnifyingglass"),
                 error: hasError,
                 errorMessage: "Error Message",
                 font: .footnote
             )
             RasmTextField(
                 text: $textField2,
                 placeholder: "Rectangle",
                 style: .rectangle(borderColor: .green, borderWidth: 2), font: .footnote
             )
             
             RasmTextField(
                 text: $textField3,
                 placeholder: "No Border",
                 style: .noBorder,
                 leadingImage: Image(systemName: "magnifyingglass"),
                 trailingImage: Image(systemName: "magnifyingglass"), font: .footnote
             )
             
             RasmTextField(
                 text: $textField4,
                 placeholder: "Single Line",
                 style: .singleLine(borderColor: .gray, borderWidth: 2), font: .footnote
             )
             
             RasmTextField(
                 text: $textField5,
                 placeholder: "With Error",
                 style: .rectangle(borderColor: .gray, borderWidth: 2),
                 error: hasError,
                 errorColor: .red, font: .footnote
             )
             Spacer()
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
}

#Preview {
    TextFieldsView()
}
