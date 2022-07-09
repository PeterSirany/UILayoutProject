//
//  AirportArrivalSTAR.swift
//  Views
//
//  Created by Richard Poutier on 7/8/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public class AirportArrivalStar: Viewable {
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

extension AirportArrivalStar {
	public static func == (lhs: AirportArrivalStar, rhs: AirportArrivalStar) -> Bool {
		return lhs.name == rhs.name && lhs.initialAltitude == rhs.initialAltitude && lhs.waypoints == rhs.waypoints && lhs.descentGradient == rhs.descentGradient
	}
	public func hash(into hasher: inout Hasher) {
		hasher.combine(name)
		hasher.combine(initialAltitude)
		hasher.combine(waypoints)
		hasher.combine(descentGradient)
	}
}
