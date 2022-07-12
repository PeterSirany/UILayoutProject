//
//  AirportRunwayEntity+CoreDataClass.swift
//
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData
import Models

@objc(AirportRunwayEntity)
public class AirportRunwayEntity: NSManagedObject {
	public func toModel() -> AirportRunway? {
		guard let name = self.name else { return nil }
		guard let heading = self.heading?.toModel() else { return nil }
		guard let threshold = self.displaced_threshold?.toModel() else { return nil }
		let departureSids = self.departureSIDs?.compactMap { ($0 as? AirportDepartureSIDEntity)?.toModel() }
		let stars = self.arrivalStars?.compactMap { ($0 as? AirportArrivalSTAREntity)?.toModel() }
		let intersections = self.intersections?.compactMap { ($0 as? RunwayIntersectionEntity)?.toModel() }
		return .init(
			name: name,
			length: self.length,
			touchDownZoneElevation: self.touchDownZoneElevation,
			heading: heading,
			displacedThreshold: threshold,
			departureSids: departureSids ?? [],
			arrivalStars: stars ?? [],
			intersections: intersections ?? [])
	}
}

extension AirportRunwayEntity {
	public func save(runway: AirportRunway, context: NSManagedObjectContext) throws {
		do {
			self.name = runway.name
			let heading = HeadingEntity(context: context)
			heading.degreeStyle = runway.heading.variation?.rawValue
			heading.value = runway.heading.value
			self.heading = heading
			
			let threshold = DisplacedThresholdEntity(context: context)
			threshold.value = runway.displacedThreshold.value
			threshold.distanceMeasurementType = runway.displacedThreshold.measurementType.rawValue
			self.displaced_threshold = threshold
			
			let stars = AirportArrivalSTAREntity.fetchRequest()
			var starResults = Set(try context.fetch(stars))
			starResults = starResults.filter({ star in
				return runway.departureSids.contains(where: { $0.id == star.id })
			})
			self.addToArrivalStars(NSSet(set: starResults))
			
			let sids = AirportDepartureSIDEntity.fetchRequest()
			var sidResults = Set(try context.fetch(sids))
			sidResults = sidResults.filter({ sid in
				return runway.departureSids.contains(where: { $0.id == sid.id })
			})
			self.addToDepartureSIDs(NSSet(set: sidResults))
		}
	}
}
