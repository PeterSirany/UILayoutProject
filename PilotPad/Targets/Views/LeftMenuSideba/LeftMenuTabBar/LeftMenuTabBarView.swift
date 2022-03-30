//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI
import Common

struct LeftMenuTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selectedTabBarItem: TabBarItem
    
    var body: some View {
        
        VStack {
            HStack(alignment: .bottom) {
                ForEach(tabs, id: \.self) { tab in
                    tabView(tab: tab)
                        .onTapGesture {
                            switchToTab(tab: tab)
                        }
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct LeftMenuTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "gearshape.2", title: "Settings", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "doc.plaintext", title: "PDF View", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "bed.double", title: "Rest A", color: Color.preliminaryTextColor),
        TabBarItem(iconName: "cloud.sun.rain", title: "Rest B", color: Color.preliminaryTextColor)
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            
            LeftMenuTabBarView(tabs: tabs, selectedTabBarItem: .constant(tabs.first!))
                .preferredColorScheme(.dark)
        }
    }
}

extension LeftMenuTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack(spacing: 5) {
            Image(systemName: tab.iconName)
                .symbolRenderingMode(.palette)
                .foregroundStyle((selectedTabBarItem == tab ? Color.actualTextColor : tab.color), (selectedTabBarItem == tab ? Color.timeColor : tab.color), (selectedTabBarItem == tab ? Color("AlysiasRoomTeal") : tab.color))
                .frame(width: 55, height: 55)
                .imageScale(.large)
                .background(Color.blackBackgroundColor.clipShape(Circle()))
            Text(tab.title)
                .font(.caption2)
                .padding(.horizontal)
            
        }
        .foregroundColor(tab.color)
        .padding(.top, 8)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selectedTabBarItem = tab
        }
    }
    
}

struct TabBarItem: Hashable {
    let iconName: String
    let title: String
    let color: Color
}
