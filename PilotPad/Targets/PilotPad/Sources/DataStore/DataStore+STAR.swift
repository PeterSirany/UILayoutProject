//
//  DataStore+STAR.swift
//  PilotPad
//
//  Created by Richard Poutier on 7/8/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import CoreData
import ViewModels
import Models

extension DataStoreImpl {
	public func save(departureSid: AirportDepartureSid) throws {
		let entity = AirportDepartureSIDEntity(context: self.managedObjectContext)
		try entity.save(sid: departureSid, context: self.managedObjectContext)
	}
	public func save(intersection: RunwayIntersection) throws {
		let entity = RunwayIntersectionEntity(context: self.managedObjectContext)
		try entity.save(intersection, context: self.managedObjectContext)
	}
	
	public func save(arrivalStar: AirportArrivalStar) throws {
		let entity = AirportArrivalSTAREntity(context: self.managedObjectContext)
		try entity.save(arrivalStar: arrivalStar, context: managedObjectContext)
	}
	
	public func save(runway: AirportRunway) throws {
		let entity = AirportRunwayEntity(context: self.managedObjectContext)
		try entity.save(runway: runway, context: self.managedObjectContext)
	}
}
