//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation

public struct ChecklistItemModel: Identifiable {
	public let id: String
	public let title: String
	public let isComplete: Bool
	
	public init(id: String = UUID().uuidString, title: String, isComplete: Bool) {
		self.id = id
		self.title = title
		self.isComplete = isComplete
	}
	
	public func updateCompletion() -> ChecklistItemModel {
		return ChecklistItemModel(id: id, title: title, isComplete: !isComplete)
	}
	
}
