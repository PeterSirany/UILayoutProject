//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation
import SwiftUI
import Models

public class LeftMenuNavigationViewModel: ObservableObject {
	
	@Published public var leftMenuNavigationItems: [leftMenuNavigationItemModel] = []
	
	public init() {
		getItems()
	}
	
	public func getItems() {
		let newItems = [
			leftMenuNavigationItemModel(title: "Main Menu", isSelected: false),
			leftMenuNavigationItemModel(title: "Main View One", isSelected: false),
			leftMenuNavigationItemModel(title: "Main View Two", isSelected: false),
			leftMenuNavigationItemModel(title: "Main View Three", isSelected: false),
			leftMenuNavigationItemModel(title: "Main View Four", isSelected: false),
		]
		
		leftMenuNavigationItems.append(contentsOf: newItems)
	}
	
	public func updateLetMenuNavigationItem(item: leftMenuNavigationItemModel) {
		if let index = leftMenuNavigationItems.firstIndex(where: { $0.id == item.id}) {
			
			leftMenuNavigationItems[index] = item.updateSelection()
		}
	}
	
}
