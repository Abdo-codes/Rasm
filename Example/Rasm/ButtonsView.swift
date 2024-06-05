//
//  ButtonsView.swift
//  Rasm_Example
//
//  Created by MahmoudFares on 02/06/2024.
//  Copyright © 2024 Fares. All rights reserved.
//

import SwiftUI
import RasmButtons

struct ButtonsView: View {
    @State  var isButtonDisabled: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    RasmButtonView(
                        viewState: .init(
                            type: .normal,
                            title: "Fill",
                            font: .callout,
                            buttonStyle: .shapeBorderStyle(
                                shape: .circle,
                                style: .fill(Color.blue, disbaledColor: .gray.opacity(0.1)),
                                onFocusColor: Color.red,
                                foregroundColor: Color.white,
                                disableColor: Color.gray,
                                isDisabled: isButtonDisabled
                            ),
                            action: {
                            }
                        )
                    )
                    .frame(width: 70, height: 70)

                    RasmButtonView(
                        viewState: .init(
                            type: .normal,
                            title: "Border",
                            font: .callout,
                            buttonStyle: .shapeBorderStyle(
                                shape: .circle,
                                style: .border(Color.green, disbaledColor: .gray.opacity(0.1), lineWidth: 2),
                                onFocusColor: Color.red,
                                foregroundColor: Color.green,
                                disableColor: Color.gray,
                                isDisabled: isButtonDisabled
                            ),
                            action: {
                            }
                            
                        )
                    )
                    .frame(width: 70, height: 70)
                    RasmButtonView(
                        viewState: .init(
                            type: .normal,
                            title: "Dotted",
                            font: .callout,
                            buttonStyle: .shapeBorderStyle(
                                shape: .circle,
                                style: .dottedBorder(Color.red, disbaledColor: .gray.opacity(0.1), lineWidth: 2, dash: [5, 3]),
                                onFocusColor: Color.blue,
                                foregroundColor: Color.red,
                                disableColor: Color.gray,
                                isDisabled: isButtonDisabled
                            ),
                            action: {
                            }
                            
                        )
                    )
                    .frame(width: 70, height: 70)
                }
                RasmButtonView(
                    viewState: .init(
                        type: .normal,
                        title: "Hit Me Ghost",
                        font: .body,
                        buttonStyle: .shapeBorderStyle(
                            shape: .ghost,
                            style: .ghost,
                            onFocusColor: Color.yellow,
                            foregroundColor: Color.black,
                            disableColor: Color.gray,
                            isDisabled: false
                        ),
                        action: {}
                    )
                )

                RasmButtonView(
                    viewState: .init(
                        type: .normal,
                        title: "Rounded Fill",
                        font: .callout,
                        buttonStyle: .shapeBorderStyle(
                            shape: .roundedRectangle(cornerRadius: 10),
                            style: .fill(Color.purple, disbaledColor: .gray.opacity(0.1)),
                            onFocusColor: Color.yellow,
                            foregroundColor: Color.white,
                            disableColor: Color.gray,
                            isDisabled: isButtonDisabled
                        ),
                        action: {
                        }
                        
                    )
                )
                
                RasmButtonView(
                    viewState: .init(
                        type: .normal,
                        title: "Rounded Border",
                        font: .callout,
                        buttonStyle: .shapeBorderStyle(
                            shape: .roundedRectangle(cornerRadius: 10),
                            style: .border(Color.orange, disbaledColor: .gray.opacity(0.1), lineWidth: 2),
                            onFocusColor: Color.yellow,
                            foregroundColor: Color.orange,
                            disableColor: Color.gray,
                            isDisabled: isButtonDisabled
                        ),
                        action: {
                        }
                        
                    )
                )
                
                RasmButtonView(
                    viewState: .init(
                        type: .normal,
                        title: "Rounded Dotted Border",
                        font: .callout,
                        buttonStyle: .shapeBorderStyle(
                            shape: .roundedRectangle(cornerRadius: 10),
                            style: .dottedBorder(Color.gray, disbaledColor: .gray.opacity(0.1), lineWidth: 2, dash: [3, 3]),
                            onFocusColor: Color.yellow,
                            foregroundColor: Color.gray,
                            disableColor: Color.gray,
                            isDisabled: isButtonDisabled
                        ),
                        action: {
                        }
                    )
                )
           
                RasmButtonView(
                    viewState: .init(
                        type: .normal,
                        title: "Capsule Fill",
                        font: .callout,
                        buttonStyle: .shapeBorderStyle(
                            shape: .capsule,
                            style: .fill(Color.blue, disbaledColor: .gray.opacity(0.1)),
                            onFocusColor: Color.red,
                            foregroundColor: Color.white,
                            disableColor: Color.gray,
                            isDisabled: isButtonDisabled
                        ),
                        action: {
                        }
                    )
                )

                RasmButtonView(
                    viewState: .init(
                        type: .normal,
                        title: "Capsule Border",
                        font: .callout,
                        buttonStyle: .shapeBorderStyle(
                            shape: .capsule,
                            style: .border(Color.green, disbaledColor: .gray.opacity(0.1), lineWidth: 2),
                            onFocusColor: Color.red,
                            foregroundColor: Color.green,
                            disableColor: Color.gray,
                            isDisabled: isButtonDisabled
                        ),
                        action: {
                        }
                    )
                )

                RasmButtonView(
                    viewState: .init(
                        type: .normal,
                        title: "Capsule Dotted Border",
                        font: .callout,
                        buttonStyle: .shapeBorderStyle(
                            shape: .capsule,
                            style: .dottedBorder(Color.red, disbaledColor: .gray.opacity(0.1), lineWidth: 2, dash: [5, 3]),
                            onFocusColor: Color.blue,
                            foregroundColor: Color.red,
                            disableColor: Color.gray,
                            isDisabled: isButtonDisabled
                        ),
                        action: {
                        }
                    )
                )
                RasmButtonView(
                    viewState: .init(
                        type: .normal,
                        title: "Rectangle Fill",
                        font: .callout,
                        buttonStyle: .shapeBorderStyle(
                            shape: .rectangle,
                            style: .fill(Color.purple, disbaledColor: .gray.opacity(0.1)),
                            onFocusColor: Color.yellow,
                            foregroundColor: Color.white,
                            disableColor: Color.gray,
                            isDisabled: isButtonDisabled
                        ),
                        action: {
                        }
                    )
                )
                RasmButtonView(
                    viewState: .init(
                        type: .normal,
                        title: "Rectangle Border",
                        font: .callout,
                        buttonStyle: .shapeBorderStyle(
                            shape: .rectangle,
                            style: .border(Color.orange, disbaledColor: .gray.opacity(0.1), lineWidth: 2),
                            onFocusColor: Color.yellow,
                            foregroundColor: Color.orange,
                            disableColor: Color.gray,
                            isDisabled: isButtonDisabled
                        ),
                        action: {
                        }
                    )
                )
                
                RasmButtonView(
                    viewState: .init(
                        type: .normal,
                        title: "Rectangle Dotted Border",
                        font: .callout,
                        buttonStyle: .shapeBorderStyle(
                            shape: .rectangle,
                            style: .dottedBorder(Color.gray, disbaledColor: .gray.opacity(0.1), lineWidth: 2, dash: [3, 3]),
                            onFocusColor: Color.yellow,
                            foregroundColor: Color.gray,
                            disableColor: Color.gray,
                            isDisabled: isButtonDisabled
                        ),
                        action: {
                        }
                    )
                )
            }
            .padding()
        }
    }
}
#Preview {
    ButtonsView()
}
