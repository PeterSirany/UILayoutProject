//
//  Waypoint.swift
//  Models
//
//  Created by Richard Poutier on 6/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public enum WaypointType: String, Hashable {
	case enRoute
	case holding
	case sid
	case star
}

public class Waypoint: Viewable {
	public let name: String
	public let coordinateRepresentation: String
	public let variation: Heading?
	public let type: WaypointType
	public let altitude: Double?
	public let speed: Double?
	
	public init(name: String, coordinateRepresentation: String, variation: Heading?, type: WaypointType, altitude: Double?, speed: Double?) {
		self.name = name
		self.coordinateRepresentation = coordinateRepresentation
		self.variation = variation
		self.type = type
		self.altitude = altitude
		self.speed = speed
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(name)
		hasher.combine(coordinateRepresentation)
		hasher.combine(variation)
		hasher.combine(type)
		hasher.combine(altitude)
		hasher.combine(speed)
	}
	
	public static func == (lhs: Waypoint, rhs: Waypoint) -> Bool {
		lhs.name == rhs.name && lhs.coordinateRepresentation == rhs.coordinateRepresentation && lhs.type == rhs.type && lhs.variation == rhs.variation
	}
}
