
import Foundation
import SwiftUI

public struct ConditionalHiddenModifier: ViewModifier {
    let isHidden: Bool

    public func body(content: Content) -> some View {
        if !isHidden {
            content
        }
    }
}

public extension View {
    func hiddenIf(_ condition: Bool) -> some View {
        modifier(ConditionalHiddenModifier(isHidden: condition))
    }
}


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
