import Foundation
import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct ConditionalHiddenModifier: ViewModifier {
    let isHidden: Bool

    public func body(content: Content) -> some View {
        if !isHidden {
            content
        }
    }
}

@available(iOS 13.0, macOS 10.15, *)
public extension View {
    func hiddenIf(_ condition: Bool) -> some View {
        modifier(ConditionalHiddenModifier(isHidden: condition))
    }
}

#if canImport(UIKit)
import UIKit

@available(iOS 13.0, *)
public extension View {
    var toUIView: UIView {
        let view = self
        let vc = UIHostingController(rootView: view)
        guard let uiView = vc.view else {
            debugPrint("Can't find UIView")
            return UIView()
        }
        return uiView
    }
}
#elseif canImport(AppKit)
import AppKit

@available(macOS 10.15, *)
public extension View {
    var toNSView: NSView {
        let view = self
        let vc = NSHostingController(rootView: view)
        return vc.view
    }
}
#endif