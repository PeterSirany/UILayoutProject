//
//  AirportDepartureSid.swift
//  Common
//
//  Created by Richard Poutier on 6/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public class AirportDepartureSid: Viewable {
	public let id: String
	public let name: String
	public let waypoints: [Waypoint]
	public let climbGradient: ClimbGradient
	public let initialRunwayHeading: Heading
	
	public init(id: String? = nil, name: String, waypoints: [Waypoint], climbGradient: ClimbGradient, initialRunwayHeading: Heading) {
		self.id = id ?? UUID().uuidString
		self.name = name
		self.waypoints = waypoints
		self.climbGradient = climbGradient
		self.initialRunwayHeading = initialRunwayHeading
	}
	
	public func hash(into hasher: inout Hasher) {
		
	}
	
	public static func == (lhs: AirportDepartureSid, rhs: AirportDepartureSid) -> Bool {
		return lhs.name == rhs.name && lhs.waypoints == rhs.waypoints && lhs.climbGradient == rhs.climbGradient && lhs.initialRunwayHeading == rhs.initialRunwayHeading
	}
}
