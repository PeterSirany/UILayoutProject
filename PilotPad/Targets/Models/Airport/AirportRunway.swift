//
//  AirportRunway.swift
//  Common
//
//  Created by Richard Poutier on 6/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public class AirportRunway: Viewable {
	public let id: String
	public let name: String
	public let length: Double
	public let touchDownZoneElevation: Double
	public let heading: Heading
	public let displacedThreshold: DisplacedThreshold
	public let departureSids: [AirportDepartureSid]
	public let arrivalStars: [AirportArrivalStar]
	public let intersections: [RunwayIntersection]
	
	public init(id: String? = nil, name: String, length: Double, touchDownZoneElevation: Double, heading: Heading, displacedThreshold: DisplacedThreshold, departureSids: [AirportDepartureSid], arrivalStars: [AirportArrivalStar], intersections: [RunwayIntersection]) {
		self.id = id ?? UUID().uuidString
		self.name = name
		self.length = length
		self.touchDownZoneElevation = touchDownZoneElevation
		self.heading = heading
		self.displacedThreshold = displacedThreshold
		self.departureSids = departureSids
		self.arrivalStars = arrivalStars
		self.intersections = intersections
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(name)
		hasher.combine(length)
		hasher.combine(touchDownZoneElevation)
		hasher.combine(heading)
		hasher.combine(displacedThreshold)
		hasher.combine(departureSids)
		hasher.combine(arrivalStars)
		hasher.combine(intersections)
	}
	
	public static func == (lhs: AirportRunway, rhs: AirportRunway) -> Bool {
		return lhs.name == rhs.name
		&& lhs.id == rhs.id
		&& lhs.length == rhs.length
		&& lhs.touchDownZoneElevation == rhs.touchDownZoneElevation
		&& lhs.heading == rhs.heading
		&& lhs.displacedThreshold == rhs.displacedThreshold
		&& lhs.departureSids == rhs.departureSids
		&& lhs.arrivalStars == rhs.arrivalStars
		&& lhs.intersections == rhs.intersections
	}
}
