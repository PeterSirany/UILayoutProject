//
//  ClimbGradientEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData
import Models

@objc(ClimbGradientEntity)
public class ClimbGradientEntity: NSManagedObject {

	public func toModel() -> ClimbGradient? {
		guard let type = self.measurementType, let measurement = MeasurementType(rawValue: type) else { return nil }
		
		return .init(
			value: self.value,
			measurementType: measurement
		)
	}
}

extension ClimbGradientEntity {
	func save(climbGradient: ClimbGradient, context: NSManagedObjectContext) throws {
		self.value = climbGradient.value
		self.measurementType = climbGradient.measurementType.rawValue
		
		try context.save()
	}
}
