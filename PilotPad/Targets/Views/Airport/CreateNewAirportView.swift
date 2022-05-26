//
//  CreateNewAirportView.swift
//  ViewModels
//
//  Created by Richard Poutier on 5/12/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models
import ViewModels

public class CreateNewAirportViewModel: ObservableObject {
	private let dataStore: DataStore
	private let navController: NavigationContextController
	
	public init(dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navController = navigationContext
	}
	
	func save() {
		
	}
}

public struct CreateNewAirportView: View {
	@ObservedObject private var viewModel: CreateNewAirportViewModel
	
	public init(viewModel: CreateNewAirportViewModel) {
		self.viewModel = viewModel
	}
	
	public var body: some View {
		Text("hello")
	}
}
