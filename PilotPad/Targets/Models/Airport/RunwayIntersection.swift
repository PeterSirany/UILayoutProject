//
//  RunwayIntersection.swift
//  Models
//
//  Created by Richard Poutier on 6/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public class RunwayIntersection: Viewable {
	public let name: String
	public let distanceFromStart: Double
	public let remainingDistance: Double
	
	public init(name: String, distanceFromStart: Double, remainingDistance: Double) {
		self.name = name
		self.distanceFromStart = distanceFromStart
		self.remainingDistance = remainingDistance
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(name)
		hasher.combine(distanceFromStart)
		hasher.combine(remainingDistance)
	}
	
	public static func == (lhs: RunwayIntersection, rhs: RunwayIntersection) -> Bool {
		return lhs.name == rhs.name && lhs.distanceFromStart == rhs.distanceFromStart && lhs.remainingDistance == rhs.remainingDistance
	}
}
