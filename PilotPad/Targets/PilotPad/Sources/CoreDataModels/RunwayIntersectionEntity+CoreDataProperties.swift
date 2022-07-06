//
//  RunwayIntersectionEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData


extension RunwayIntersectionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RunwayIntersectionEntity> {
        return NSFetchRequest<RunwayIntersectionEntity>(entityName: "RunwayIntersectionEntity")
    }

    @NSManaged public var distanceFromStart: Double
    @NSManaged public var name: String?
    @NSManaged public var remainingDistance: Double

}
