//
//  AirportEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/19/22.
//
//

import Foundation
import CoreData


extension AirportEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AirportEntity> {
        return NSFetchRequest<AirportEntity>(entityName: "AirportEntity")
    }

    @NSManaged public var elevation: Double
    @NSManaged public var iata: String?
    @NSManaged public var icao: String?
    @NSManaged public var coordinateString: String?
    @NSManaged public var name: String?
    @NSManaged public var variation: HeadingEntity?
    @NSManaged public var runways: NSSet?

}

// MARK: Generated accessors for runways
extension AirportEntity {

    @objc(addRunwaysObject:)
    @NSManaged public func addToRunways(_ value: AirportRunwayEntity)

    @objc(removeRunwaysObject:)
    @NSManaged public func removeFromRunways(_ value: AirportRunwayEntity)

    @objc(addRunways:)
    @NSManaged public func addToRunways(_ values: NSSet)

    @objc(removeRunways:)
    @NSManaged public func removeFromRunways(_ values: NSSet)

}
