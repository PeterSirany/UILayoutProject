//
//  AirportDepartureSIDSEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData


extension AirportDepartureSIDSEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AirportDepartureSIDSEntity> {
        return NSFetchRequest<AirportDepartureSIDSEntity>(entityName: "AirportDepartureSIDSEntity")
    }

    @NSManaged public var altitude: Double
    @NSManaged public var course: Double
    @NSManaged public var name: String?
    @NSManaged public var airport: AirportEntity?

}
