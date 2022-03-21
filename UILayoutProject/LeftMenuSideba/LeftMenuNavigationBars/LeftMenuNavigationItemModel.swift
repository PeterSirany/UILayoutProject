//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation

struct leftMenuNavigationItemModel: Identifiable {
    let id: String
    let title: String
    let isSelected: Bool
    
    init(id: String = UUID().uuidString, title: String, isSelected: Bool) {
        self.id = id
        self.title = title
        self.isSelected = isSelected
    }
        
        func updateSelection() -> leftMenuNavigationItemModel {
            return leftMenuNavigationItemModel(id: id, title: title, isSelected: !isSelected)
        }
}
