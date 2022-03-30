//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation

public struct leftMenuNavigationItemModel: Identifiable {
	public let id: String
	public let title: String
	public let isSelected: Bool
	
	public init(id: String = UUID().uuidString, title: String, isSelected: Bool) {
		self.id = id
		self.title = title
		self.isSelected = isSelected
	}
	
	public func updateSelection() -> leftMenuNavigationItemModel {
		return leftMenuNavigationItemModel(id: id, title: title, isSelected: !isSelected)
	}
}
