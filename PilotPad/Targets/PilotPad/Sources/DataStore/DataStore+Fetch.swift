//
//  DataStore+Fetch.swift
//  PilotPad
//
//  Created by Richard Poutier on 7/9/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import CoreData
import Models
import ViewModels

extension DataStoreImpl {
	public func fetchArrivalStars() throws -> [AirportArrivalStar] {
		do {
			let request = AirportArrivalSTAREntity.fetchRequest()
			let results = try self.managedObjectContext.fetch(request)
			let models = results.compactMap { $0.toModel() }
			return models
		}
	}
	
	public func fetchDepartureSids() throws -> [AirportDepartureSid] {
		do {
			let request = AirportDepartureSIDEntity.fetchRequest()
			let results = try self.managedObjectContext.fetch(request)
			let models = results.compactMap { $0.toModel() }
			return models
		}
	}
}
