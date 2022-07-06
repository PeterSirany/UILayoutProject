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
		guard let name = self.name else { return nil }
		guard let gradient = self.requiredClimbGradient?.toModel() else { return nil }
		guard let heading = self.initialRunwayHeading?.toModel() else { return nil }
		let waypoints = self.waypoints?.compactMap { ($0 as? WaypointEntity)?.toModel() }
		
		return .init(
			name: name,
			waypoints: waypoints ?? [],
			climbGradient: gradient,
			initialRunwayHeading: heading
		)
	}
}
