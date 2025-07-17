// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let PACKAGE_NAME = "Rasm"
private let BUTTONS_TARGET_NAME = PACKAGE_NAME + "Buttons"
private let MODIFIERS_TARGET_NAME = PACKAGE_NAME + "Modifiers"
private let TEXTFIELDS_TARGET_NAME = PACKAGE_NAME + "TextFields"
private let UMBRELLA_TARGET_NAME = PACKAGE_NAME

private var modifierTarget: Target.Dependency  {
    .target(name: MODIFIERS_TARGET_NAME)
}

let package = Package(
    name: PACKAGE_NAME,
    platforms: [.iOS(.v15), .macOS(.v10_15)],
    products: [
        .library(
            name: PACKAGE_NAME,
            targets: [
                UMBRELLA_TARGET_NAME
            ]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: MODIFIERS_TARGET_NAME
        ),
        .target(
            name: TEXTFIELDS_TARGET_NAME,
            dependencies: [
                modifierTarget
            ]
        ),
        .target(
            name: BUTTONS_TARGET_NAME,
            dependencies: [
                modifierTarget,
            ]
        ),
        .target(
            name: UMBRELLA_TARGET_NAME,
            dependencies: [
                modifierTarget,
                .target(name: BUTTONS_TARGET_NAME),
                .target(name: TEXTFIELDS_TARGET_NAME)
            ]
        )
    ]
)
