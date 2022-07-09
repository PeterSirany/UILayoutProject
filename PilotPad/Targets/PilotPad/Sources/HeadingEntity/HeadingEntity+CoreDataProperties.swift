//
//  HeadingEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData
import Models


extension HeadingEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeadingEntity> {
        return NSFetchRequest<HeadingEntity>(entityName: "HeadingEntity")
    }

    @NSManaged public var degreeStyle: String?
    @NSManaged public var value: String?

	public struct Keys {
		static let entityName = "HeadingEntity"
		static let degreeStyle = "degreeStyle"
		static let value = "value"
	}
}
