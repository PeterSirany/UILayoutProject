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

public class AirportArrivalStar {
	public init(name: String, initialAltitude: Double, waypoints: [Waypoint], descentGradient: ClimbGradient) {
		self.name = name
		self.initialAltitude = initialAltitude
		self.waypoints = waypoints
		self.descentGradient = descentGradient
	}
	
	public let name: String
	public let initialAltitude: Double
	public let waypoints: [Waypoint]
	public let descentGradient: ClimbGradient
}

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
