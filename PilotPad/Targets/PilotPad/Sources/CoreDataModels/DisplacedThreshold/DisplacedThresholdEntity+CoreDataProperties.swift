//
//  DisplacedThresholdEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData


extension DisplacedThresholdEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DisplacedThresholdEntity> {
        return NSFetchRequest<DisplacedThresholdEntity>(entityName: "DisplacedThresholdEntity")
    }

    @NSManaged public var distanceMeasurementType: String?
    @NSManaged public var value: Double

}
