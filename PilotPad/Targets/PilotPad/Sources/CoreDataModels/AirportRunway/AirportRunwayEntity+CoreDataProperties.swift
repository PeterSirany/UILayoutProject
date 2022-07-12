//
//  AirportRunwayEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 7/11/22.
//
//

import Foundation
import CoreData


extension AirportRunwayEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AirportRunwayEntity> {
        return NSFetchRequest<AirportRunwayEntity>(entityName: "AirportRunwayEntity")
    }

    @NSManaged public var length: Double
    @NSManaged public var name: String?
    @NSManaged public var touchDownZoneElevation: Double
    @NSManaged public var departureSIDs: NSSet?
    @NSManaged public var displaced_threshold: DisplacedThresholdEntity?
    @NSManaged public var heading: HeadingEntity?
    @NSManaged public var intersections: NSSet?
    @NSManaged public var arrivalStars: NSSet?

}

// MARK: Generated accessors for departureSIDs
extension AirportRunwayEntity {

    @objc(addDepartureSIDsObject:)
    @NSManaged public func addToDepartureSIDs(_ value: AirportDepartureSIDEntity)

    @objc(removeDepartureSIDsObject:)
    @NSManaged public func removeFromDepartureSIDs(_ value: AirportDepartureSIDEntity)

    @objc(addDepartureSIDs:)
    @NSManaged public func addToDepartureSIDs(_ values: NSSet)

    @objc(removeDepartureSIDs:)
    @NSManaged public func removeFromDepartureSIDs(_ values: NSSet)

}

// MARK: Generated accessors for intersections
extension AirportRunwayEntity {

    @objc(addIntersectionsObject:)
    @NSManaged public func addToIntersections(_ value: RunwayIntersectionEntity)

    @objc(removeIntersectionsObject:)
    @NSManaged public func removeFromIntersections(_ value: RunwayIntersectionEntity)

    @objc(addIntersections:)
    @NSManaged public func addToIntersections(_ values: NSSet)

    @objc(removeIntersections:)
    @NSManaged public func removeFromIntersections(_ values: NSSet)

}

// MARK: Generated accessors for arrivalStars
extension AirportRunwayEntity {

    @objc(addArrivalStarsObject:)
    @NSManaged public func addToArrivalStars(_ value: AirportArrivalSTAREntity)

    @objc(removeArrivalStarsObject:)
    @NSManaged public func removeFromArrivalStars(_ value: AirportArrivalSTAREntity)

    @objc(addArrivalStars:)
    @NSManaged public func addToArrivalStars(_ values: NSSet)

    @objc(removeArrivalStars:)
    @NSManaged public func removeFromArrivalStars(_ values: NSSet)

}
