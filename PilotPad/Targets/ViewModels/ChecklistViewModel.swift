//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation
import Models

public class ChecklistViewModel: ObservableObject {
	
	@Published public var checklistItems: [ChecklistItemModel] = []
	
	public init() {
		getItems()
	}
	
	public func getItems() {
		let newItems = [
			ChecklistItemModel(title: "1st", isComplete: true),
			ChecklistItemModel(title: "Checklist Item 2", isComplete: true),
			ChecklistItemModel(title: "Third", isComplete: false),
			ChecklistItemModel(title: "Fourth Item", isComplete: false),
			ChecklistItemModel(title: "Last Item", isComplete: false),
		]
		
		checklistItems.append(contentsOf: newItems)
	}
	
	public func updateChecklistItem(item: ChecklistItemModel) {
		if let index = checklistItems.firstIndex(where: { $0.id == item.id})
		{
			checklistItems[index] = item.updateCompletion()
		}
	}
}
