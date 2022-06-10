//
//  AirportHoldingWaypointEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData
import Models

@objc(AirportHoldingWaypointEntity)
public class AirportHoldingWaypointEntity: NSManagedObject {

	public func toModel() -> AirportHoldingWaypoint? {
		guard let name = self.name else { return nil }
		let holding = AirportHoldingWaypoint()
		holding.name = name
		holding.fuelBurn = self.fuel_burn
		holding.altitude = self.altitude
		return holding
	}
}
