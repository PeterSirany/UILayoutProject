//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI

struct TabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content ) {
        self._selection = selection
        self.content = content()
    }
    
    
    var body: some View {
        
            LeftMenuTabBarView(tabs: tabs, selectedTabBarItem: $selection)
        
    }
}

struct TabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "gearshape.2", title: "Settings", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "doc.plaintext", title: "PDF View", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "bed.double", title: "Rest A", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "cloud.sun.rain", title: "Rest B", color: Color.preliminaryTextColor)
    ]
    
    static var previews: some View {
        TabBarContainerView(selection: .constant(tabs.first!)) {
            ChecklistAddItemView()

        }
    }
}
