//
//  ClimbGradientEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData


extension ClimbGradientEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClimbGradientEntity> {
        return NSFetchRequest<ClimbGradientEntity>(entityName: "ClimbGradientEntity")
    }

    @NSManaged public var measurementType: String?
    @NSManaged public var value: Double

}
