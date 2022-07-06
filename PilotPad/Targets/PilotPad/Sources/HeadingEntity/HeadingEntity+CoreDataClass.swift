//
//  HeadingEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData
import Models

@objc(HeadingEntity)
public class HeadingEntity: NSManagedObject {

	func toModel() -> Heading? {
		let variation = self.degreeStyle == nil ? nil : HeadingVariation(rawValue: self.degreeStyle!)
		guard let value = self.value else { return nil }
		return .init(
			value: value,
			variation: variation
		)
	}
}
