//
//  NavigationContextController.swift
//  ViewModels
//
//  Created by Richard Poutier on 4/23/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models

public class NavigationContextController: ObservableObject {
	@Published public var currentMainView: ViewFactoryView
	private var navigationStack: [ViewFactoryView] = []
	
	public init() {
		self.currentMainView = .mainMenu
		navigationStack = [.mainMenu]
	}
	
	public func show(view: ViewFactoryView) {
		navigationStack.append(view)
		self.currentMainView = view
	}
	
	public func back() {
		navigationStack.removeLast()
		if !navigationStack.isEmpty {
			self.currentMainView = navigationStack.last!
		} else {
			fatalError("Unexpected number of views found on stack")
		}
	}
}
