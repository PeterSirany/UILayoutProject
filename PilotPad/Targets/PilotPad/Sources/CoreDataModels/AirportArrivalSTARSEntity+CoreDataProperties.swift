//
//  AirportArrivalSTARSEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData


extension AirportArrivalSTARSEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AirportArrivalSTARSEntity> {
        return NSFetchRequest<AirportArrivalSTARSEntity>(entityName: "AirportArrivalSTARSEntity")
    }

    @NSManaged public var course: Double
    @NSManaged public var initial_altitude: Double
    @NSManaged public var name: String?
    @NSManaged public var airport: AirportEntity?

}
