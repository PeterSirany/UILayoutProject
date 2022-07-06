//
//  RunwayIntersectionEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData
import Models

@objc(RunwayIntersectionEntity)
public class RunwayIntersectionEntity: NSManagedObject {
	public func toModel() -> RunwayIntersection? {
		guard let name = self.name else { return nil }
		return .init(
			name: name,
			distanceFromStart: self.distanceFromStart,
			remainingDistance: self.remainingDistance
		)
	}
}
