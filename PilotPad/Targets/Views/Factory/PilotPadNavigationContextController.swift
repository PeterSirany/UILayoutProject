//
//  PilotPadNavigationContextController.swift
//  ViewModels
//
//  Created by Richard Poutier on 4/23/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public class PilotPadNavigationContextController: ObservableObject {
	private let viewFactory: ViewFactory
	@Published public var currentMainView: ViewFactoryView
	
	public init(viewFactory: ViewFactory) {
		self.viewFactory = viewFactory
		self.currentMainView = .availableAircraftList
	}
	
	public func show(view: ViewFactoryView) {
		self.currentMainView = view
	}
	
	@ViewBuilder
	public func get(view: ViewFactoryView) -> some View {
		viewFactory.build(view)
	}
}
