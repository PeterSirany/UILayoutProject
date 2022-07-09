//
//  AirportArrivalSTAREntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData
import Models

@objc(AirportArrivalSTAREntity)
public class AirportArrivalSTAREntity: NSManagedObject {

	public func toModel() -> AirportArrivalStar? {
		guard let name = self.name,
					let descentGradient = self.descentGradient?.toModel() else { return nil }
		let waypoints = self.waypoints?.compactMap { ($0 as? WaypointEntity)?.toModel() }
		
		return .init(
			name: name,
			initialAltitude: self.initialAltitude,
			waypoints: waypoints ?? [],
			descentGradient: descentGradient
		)
	}
}

extension AirportArrivalSTAREntity {
	func save(arrivalStar: AirportArrivalStar, context: NSManagedObjectContext) throws {
		do {
			self.name = arrivalStar.name
			self.initialAltitude = arrivalStar.initialAltitude
			try arrivalStar.waypoints.forEach { waypoint in
				let wEntity = WaypointEntity(context: context)
				try wEntity.save(waypoint: waypoint, context: context)
				self.addToWaypoints(wEntity)
			}
			let gradient = ClimbGradientEntity(context: context)
			try gradient.save(climbGradient: arrivalStar.descentGradient, context: context)
			self.descentGradient = gradient
			
			try context.save()
		}
	}
}
