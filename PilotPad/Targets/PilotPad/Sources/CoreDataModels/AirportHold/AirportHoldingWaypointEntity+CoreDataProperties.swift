//
//  AirportHoldingWaypointEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData


extension AirportHoldingWaypointEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AirportHoldingWaypointEntity> {
        return NSFetchRequest<AirportHoldingWaypointEntity>(entityName: "AirportHoldingWaypointEntity")
    }

    @NSManaged public var altitude: Double
    @NSManaged public var fuel_burn: Double
    @NSManaged public var name: String?
    @NSManaged public var airport: AirportEntity?

}
