//
//  DisplacedThresholdEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData
import Models

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
