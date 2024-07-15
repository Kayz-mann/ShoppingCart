//
//  CustomModifier.swift
//  Appetizer
//
//  Created by Balogun Kayode on 14/07/2024.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
