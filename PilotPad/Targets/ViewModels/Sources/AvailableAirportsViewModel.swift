//
//  AvailableAirportsViewModel.swift
//  ViewModels
//
//  Created by Richard Poutier on 5/12/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models

public class AvailableAirportsViewModel: ObservableObject {
	private let navController: NavigationContextController
	
	public init(navigationContext: NavigationContextController) {
		self.navController = navigationContext
	}
	
	public func back() {
		navController.back()
	}
	
	public func createNewAircraft() {
		
	}
	
	public func airportSelected() {
		
	}
	
}
