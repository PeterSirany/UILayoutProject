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
		let intersections = self.intersections?.compactMap { ($0 as? RunwayIntersectionEntity)?.toModel() }
		return .init(
			name: name,
			length: self.length,
			touchDownZoneElevation: self.touchDownZoneElevation,
			heading: heading,
			displacedThreshold: threshold,
			departureSids: departureSids ?? [],
			intersections: intersections ?? [])
	}
}
