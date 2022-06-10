//
//  AirportApproachEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData


extension AirportApproachEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AirportApproachEntity> {
        return NSFetchRequest<AirportApproachEntity>(entityName: "AirportApproachEntity")
    }

    @NSManaged public var faf_altitude: Double
    @NSManaged public var final_crs: Double
    @NSManaged public var name: String?
    @NSManaged public var airport: AirportEntity?

}
