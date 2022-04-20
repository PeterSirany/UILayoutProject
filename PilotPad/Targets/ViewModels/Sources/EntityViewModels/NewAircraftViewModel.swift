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
	
	public init(aircraft: Aircraft, dataStore: DataStore) {
		self.aircraft = aircraft
		self.dataStore = dataStore
		self.flapsModel = .init(items: aircraft.flaps)
		self.fetch()
	}
	
	public func save() {
		do {
			try self.dataStore.save(aircraft: aircraft)
			print("Save successful")
		} catch {
			print("Error saving aircraft: \(error)")
		}
	}
	
	public func fetch() {
		do {
			try self.dataStore.fetchAirplane()
		} catch {
			print("Something went wrong fetching airplanes: \(error.localizedDescription)")
		}
	}
}
