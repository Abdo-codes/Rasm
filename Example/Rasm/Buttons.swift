//
//  ViewController.swift
//  Rasm
//
//  Created by knight6700 on 03/19/2024.
//  Copyright (c) 2024 knight6700. All rights reserved.
//

import UIKit
import SwiftUI
import RasmButtons

enum Types: String, CaseIterable {
    case Buttons
    case textFields
}
class TableViewController: UIViewController {
    
    // Create a UITableView instance
    let tableView = UITableView()

    // Sample data
    let data: [Types] = Types.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title
        title = "Rasm Components"
        
        // Add tableView to the view
        view.addSubview(tableView)
        
        // Set up the table view's frame and constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Register the cell class
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Set the data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension TableViewController: UITableViewDataSource {
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].rawValue
        return cell
    }
}

// MARK: - UITableViewDelegate

extension TableViewController: UITableViewDelegate {
    // Did select row at index path
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch data[indexPath.row] {
        case .Buttons:
            let vc = UIHostingController(rootView: ButtonsView())
            self.navigationController?.pushViewController(vc, animated: true)
        case .textFields:
            print("Selected \(data[indexPath.row])")
        }
    }
}

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
