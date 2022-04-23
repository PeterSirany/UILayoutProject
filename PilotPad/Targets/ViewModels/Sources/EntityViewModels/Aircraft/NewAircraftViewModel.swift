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
	
	public init(aircraft: Aircraft, dataStore: DataStore, navigationContext: NavigationContextController) {
		self.aircraft = aircraft
		self.dataStore = dataStore
		self.navigationContext = navigationContext
		self.flapsModel = .init(items: aircraft.flaps)
	}
	
	public func save() {
		do {
			try self.dataStore.save(aircraft: aircraft)
			self.navigationContext.show(view: .availableAircraftList)
			print("Save successful")
		} catch {
			print("Error saving aircraft: \(error)")
		}
	}
	public func back() {
		self.navigationContext.show(view: .availableAircraftList)
	}
}
