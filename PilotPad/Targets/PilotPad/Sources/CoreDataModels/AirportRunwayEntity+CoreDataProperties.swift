//
//  AirportRunwayEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData


extension AirportRunwayEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AirportRunwayEntity> {
        return NSFetchRequest<AirportRunwayEntity>(entityName: "AirportRunwayEntity")
    }

    @NSManaged public var heading: Double
    @NSManaged public var length: Double
    @NSManaged public var name: String?
    @NSManaged public var airport: AirportEntity?

}
