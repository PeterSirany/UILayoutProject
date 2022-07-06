//
//  WaypointEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData
import Models

@objc(WaypointEntity)
public class WaypointEntity: NSManagedObject {

	public func toModel() -> Waypoint? {
		guard let name = self.name,
						let coordinate = self.coordinateString,
						let variation = self.variation?.toModel(),
					let type = self.type,
						let waypointType = WaypointType(rawValue: type) else {
			return nil
		}
		return Waypoint(
			name: name,
			coordinateRepresentation: coordinate,
			variation: variation,
			type: waypointType,
			altitude: self.altitude == 0 ? nil : self.altitude,
			speed: self.speed == 0 ? nil : self.speed
		)
	}
}
