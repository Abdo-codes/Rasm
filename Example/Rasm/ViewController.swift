//
//  ViewController.swift
//  Rasm
//
//  Created by knight6700 on 03/19/2024.
//  Copyright (c) 2024 knight6700. All rights reserved.
//

import UIKit
import SwiftUI
import Rasm

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = RasmButtonView(
            viewState: .init(
                type: .normal,
                title: "Hit Me",
                font: .callout,
                buttonStyle: .outlineStyle(
                    foregroundColor: .black,
                    onFocusColor: .blue,
                    borderColor: .black,
                    disableColor: .gray.opacity(0.2),
                    borderWidth: 2,
                    borderType: .dashed(10),
                    isDisable: false
                ),
                image: "logo",
                action: {}
            )
        )
        .toUIView
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        button.layoutIfNeeded()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

#Preview("OutLine") {
    RasmButtonView(
        viewState: .init(
            type: .normal,
            title: "Hit Me",
            font: .body,
            buttonStyle: .outlineStyle(
                foregroundColor: .black,
                onFocusColor: .blue,
                borderColor: .black,
                disableColor: .gray.opacity(0.2),
                borderWidth: 2,
                borderType: .dashed(10),
                isDisable: false
            ),
            action: {}
        )
    )
}
#Preview("Solid") {
    RasmButtonView(
        viewState: .init(
            type: .withImage,
            title: "Hit Me",
            font: .callout,
            buttonStyle: .solidStyle(
                backgroundColor: .brown,
                onFocusColor: .blue,
                disableColor: .gray.opacity(0.2),
                foreground: .red,
                cornerRadius: 10,
                isDisable: false
            ),
            image: "logo",
            action: {}
            
        )
    )
    .padding()
}
#Preview("Ghost") {
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
}


#Preview("Shapes buttons") {
    @State  var isButtonDisabled: Bool = false
    return VStack(spacing: 20) {
        HStack {
            RasmButtonView(
                viewState: .init(
                    type: .normal,
                    title: "Fill",
                    font: .callout,
                    buttonStyle: .shapeBorderStyle(
                        shape: .circle,
                        style: .fill(Color.blue),
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
                        style: .border(Color.green, lineWidth: 2),
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
                        style: .dottedBorder(Color.red, lineWidth: 2, dash: [5, 3]),
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
                title: "Rounded Fill",
                font: .callout,
                buttonStyle: .shapeBorderStyle(
                    shape: .roundedRectangle(cornerRadius: 10),
                    style: .fill(Color.purple),
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
                    style: .border(Color.orange, lineWidth: 2),
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
                    style: .dottedBorder(Color.gray, lineWidth: 2, dash: [3, 3]),
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
                    style: .fill(Color.blue),
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
                    style: .border(Color.green, lineWidth: 2),
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
                    style: .dottedBorder(Color.red, lineWidth: 2, dash: [5, 3]),
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
                    style: .fill(Color.purple),
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
                    style: .border(Color.orange, lineWidth: 2),
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
                    style: .dottedBorder(Color.gray, lineWidth: 2, dash: [3, 3]),
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
