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
	private let dataStore: DataStore
	
	public init(dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navController = navigationContext
		fetchAirports()
	}
	
	func fetchAirports() {
		do {
			let airports = try self.dataStore.fetchAirports()
			print(airports.map { $0.description })
			print("Num Airports : \(airports.count)")
		} catch {
			print("Error Fetching: \(error)")
		}
	}
	
	public func back() {
		navController.back()
	}
	
	public func createNewAircraft() {
		navController.show(view: .newAirport)
	}
	
	public func airportSelected() {
		
	}
	
}
