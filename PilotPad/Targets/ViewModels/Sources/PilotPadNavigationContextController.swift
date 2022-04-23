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
	
	public init() {
		self.currentMainView = .availableAircraftList
	}
	
	public func show(view: ViewFactoryView) {
		self.currentMainView = view
	}
}
