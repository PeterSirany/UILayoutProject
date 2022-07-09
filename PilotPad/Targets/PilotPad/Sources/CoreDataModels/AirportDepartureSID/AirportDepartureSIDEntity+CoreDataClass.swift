//
//  AirportDepartureSIDEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData
import Models

@objc(AirportDepartureSIDEntity)
public class AirportDepartureSIDEntity: NSManagedObject {

	public func toModel() -> AirportDepartureSid? {
		guard let name = self.name,
					let id = self.id else { return nil }
		guard let gradient = self.requiredClimbGradient?.toModel() else { return nil }
		guard let heading = self.initialRunwayHeading?.toModel() else { return nil }
		let waypoints = self.waypoints?.compactMap { ($0 as? WaypointEntity)?.toModel() }
		
		return .init(
			id: id,
			name: name,
			waypoints: waypoints ?? [],
			climbGradient: gradient,
			initialRunwayHeading: heading
		)
	}
}

extension AirportDepartureSIDEntity {
	func save(sid: AirportDepartureSid, context: NSManagedObjectContext) throws {
		do {
			self.id = sid.id
			self.name = sid.name
			
			let request = WaypointEntity.fetchRequest()
			var results = Set(try context.fetch(request))
			results = results.filter({ entity in
				return sid.waypoints.contains(where: { $0.id == entity.id })
			})
			self.addToWaypoints(NSSet(set: results))
			
			let headingEntity = HeadingEntity(context: context)
			headingEntity.degreeStyle = sid.initialRunwayHeading.variation?.rawValue
			headingEntity.value = sid.initialRunwayHeading.value
			self.initialRunwayHeading = headingEntity
			
			let climb = ClimbGradientEntity(context: context)
			climb.value = sid.climbGradient.value
			climb.measurementType = sid.climbGradient.measurementType.rawValue
			self.requiredClimbGradient = climb
			
			try context.save()
		}
	}
}
