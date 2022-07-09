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

extension WaypointEntity {
	func save(waypoint: Waypoint, context: NSManagedObjectContext) throws {
		self.name = waypoint.name
		self.coordinateString = waypoint.coordinateRepresentation
		self.type = waypoint.type.rawValue
		// use setValue:forKey here since speed and altitude properties are optional
		self.setValue(waypoint.speed, forKey: Keys.speed)
		self.setValue(waypoint.altitude, forKey: Keys.altitude)
		let variationEntity = HeadingEntity(context: context)
		if let heading = waypoint.variation {
			try variationEntity.save(heading: heading, context: context)
			self.variation = variationEntity
		}		
		
		try context.save()
	}
}
