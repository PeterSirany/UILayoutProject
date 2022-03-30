//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation
import SwiftUI

struct TabBarItemsPreferenceKey: PreferenceKey {
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
    
    static var defaultValue: [TabBarItem] = []

    
}

struct TabBarItemViewModifier: ViewModifier {
    
    let tab: TabBarItem

    func body(content: Content) -> some View {
        content
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(tab: TabBarItem) -> some View {
        self
            .modifier(TabBarItemViewModifier(tab: tab))
    }
}
