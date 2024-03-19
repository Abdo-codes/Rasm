//
//  File.swift
//  
//
//  Created by MahmoudFares on 19/03/2024.
//

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
