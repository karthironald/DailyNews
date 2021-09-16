//
//  Extension.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 17/09/21.
//

import Foundation
import UIKit
import SwiftUI

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}

extension Optional where Wrapped == String {
    
    var wrappedValue: String {
        if let formattedTitle = self?.trimmingCharacters(in: .whitespacesAndNewlines), !formattedTitle.isEmpty {
            return formattedTitle
        } else {
            return "-"
        }
    }
    
}
