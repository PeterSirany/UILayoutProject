//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI
import Views
import ViewModels

@main
struct UILayoutProjectApp: App {
    @State var leftMenuNavigationViewModel: LeftMenuNavigationViewModel = LeftMenuNavigationViewModel()
    @State var listViewModel: ChecklistViewModel = ChecklistViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(listViewModel)
                .environmentObject(leftMenuNavigationViewModel)
        }
    }
}
