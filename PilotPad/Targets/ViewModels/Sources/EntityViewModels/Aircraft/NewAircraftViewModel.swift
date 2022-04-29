//
//  NewAircraftViewModel.swift
//  Views
//
//  Created by Richard Poutier on 4/16/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models

public class CreateNewAircraftViewModel: ObservableObject {
	@Published public var aircraft: Aircraft
	@ObservedObject public var flapsModel: CreateNewFlapsSpeedItemsModel
	private let dataStore: DataStore
	private let navigationContext: NavigationContextController
	private let newAircraft: Bool
	
	public init(aircraft: Aircraft, newAircraft: Bool, dataStore: DataStore, navigationContext: NavigationContextController) {
		self.aircraft = aircraft
		self.newAircraft = newAircraft
		self.dataStore = dataStore
		self.navigationContext = navigationContext
		self.flapsModel = .init(items: aircraft.flaps)
	}
	
	public func save() {
		do {
			if newAircraft {
				try self.dataStore.save(aircraft: aircraft)
			} else {
				try self.dataStore.update(aircraft: aircraft)
			}
			
			self.navigationContext.show(view: .availableAircraftList)
		} catch {
			print("Error saving aircraft: \(error)")
		}
	}
	public func back() {
		self.navigationContext.show(view: .availableAircraftList)
	}
}
