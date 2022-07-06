//
//  DisplacedThreshold.swift
//  Models
//
//  Created by Richard Poutier on 6/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public enum MeasurementType: String, Identifiable {
	case knots
	case meters
	case feet
}
extension MeasurementType {
	public var id: String {
		return self.rawValue
	}
}

public class DisplacedThreshold: Viewable {
	public var value: Double
	public let measurementType: MeasurementType
	
	public init(value: Double, measurementType: MeasurementType) {
		self.value = value
		self.measurementType = measurementType
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(value)
		hasher.combine(measurementType)
	}
	
	public static func == (lhs: DisplacedThreshold, rhs: DisplacedThreshold) -> Bool {
		return lhs.value == rhs.value && lhs.measurementType == rhs.measurementType
	}
}
