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
					let id = self.id,
					let descentGradient = self.descentGradient?.toModel() else { return nil }
		let waypoints = self.waypoints?.compactMap { ($0 as? WaypointEntity)?.toModel() }
		
		return .init(
			id: id,
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
			self.id = arrivalStar.id
			self.name = arrivalStar.name
			self.initialAltitude = arrivalStar.initialAltitude
			
			let request = WaypointEntity.fetchRequest()
			var results = Set(try context.fetch(request))
			results = results.filter({ entity in
				return arrivalStar.waypoints.contains(where: { $0.id == entity.id })
			})
			self.addToWaypoints(NSSet(set: results))

			let gradient = ClimbGradientEntity(context: context)
			try gradient.save(climbGradient: arrivalStar.descentGradient, context: context)
			self.descentGradient = gradient
			
			try context.save()
		}
	}
}
