//
//  WaypointEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 7/8/22.
//
//

import Foundation
import CoreData
import Models

@objc(WaypointEntity)
public class WaypointEntity: NSManagedObject {

	public func toModel() -> Waypoint? {
		print(self)
		guard let name = self.name,
					let id = self.id,
						let coordinate = self.coordinateString,
					let type = self.type,
						let waypointType = WaypointType(rawValue: type) else {
			return nil
		}
		let variation = self.variation?.toModel()
		return Waypoint(
			id: id,
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
		self.speed = waypoint.speed ?? -1
		self.altitude = waypoint.altitude ?? -1
//		self.setValue(waypoint.speed, forKey: Keys.speed)
//		self.setValue(waypoint.altitude, forKey: Keys.altitude)
		let variationEntity = HeadingEntity(context: context)
		if let heading = waypoint.variation {
			try variationEntity.save(heading: heading, context: context)
			self.variation = variationEntity
			
		}
		
		try context.save()
	}
}
