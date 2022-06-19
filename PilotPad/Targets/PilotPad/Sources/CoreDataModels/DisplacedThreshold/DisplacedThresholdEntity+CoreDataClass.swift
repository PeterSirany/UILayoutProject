//
//  DisplacedThresholdEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData

public enum MeasurementType: String {
	case knots
}

public class DisplacedThreshold {
	public init(value: Double, measurementType: MeasurementType) {
		self.value = value
		self.measurementType = measurementType
	}
	
	public let value: Double
	public let measurementType: MeasurementType
}

@objc(DisplacedThresholdEntity)
public class DisplacedThresholdEntity: NSManagedObject {
	func toModel() -> DisplacedThreshold? {
		guard let type = self.distanceMeasurementType, let measurement = MeasurementType(rawValue: type) else { return nil }
		return .init(
			value: self.value,
			measurementType: measurement
		)
	}
}
