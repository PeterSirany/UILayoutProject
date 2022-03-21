//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation

class ChecklistViewModel: ObservableObject {
    
    @Published var checklistItems: [checklistItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            checklistItemModel(title: "1st", isComplete: true),
            checklistItemModel(title: "Checklist Item 2", isComplete: true),
            checklistItemModel(title: "Third", isComplete: false),
            checklistItemModel(title: "Fourth Item", isComplete: false),
            checklistItemModel(title: "Last Item", isComplete: false),
        ]
        
        checklistItems.append(contentsOf: newItems)
    }
    
    func updateChecklistItem(item: checklistItemModel) {
        if let index = checklistItems.firstIndex(where: { $0.id == item.id})
        {
            checklistItems[index] = item.updateCompletion()
        }
    }
}
