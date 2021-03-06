//
//  AvailableAircraftViewModel.swift
//  ViewModels
//
//  Created by Richard Poutier on 4/23/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models


public class AvailableAircraftViewModel: ObservableObject {
	@Published public var sections: [AircraftTypeSection] = []
		
	private let dataStore: DataStore
	private let navigationContext: NavigationContextController
	
	public init(dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navigationContext = navigationContext
		self.fetchAirplanes()
	}
	
	func fetchAirplanes() {
		do {
			let airplanes = try self.dataStore.fetchAirplane()
			var sections = [AircraftTypeSection]()
			for airplane in airplanes {
				if let section = sections.first(where: { $0.aircraftType == airplane.type }) {
					section.airplanes.append(airplane)
				} else {
					sections.append(.init(aircraftType: airplane.type, airplanes: [airplane]))
				}
			}
			self.sections = sections
		} catch {
			print("Error: \(error.localizedDescription)")
		}
	}
	
	public func back() {
		navigationContext.back()
	}
	
	public func createNewAircraft() {
		navigationContext.show(view: .newAircraft(aircraft: .init()))
	}
	
	public func aircraftSelected(_ aircraft: Aircraft) {
		navigationContext.show(view: .existingAircraft(aircraft: aircraft))
	}
}
