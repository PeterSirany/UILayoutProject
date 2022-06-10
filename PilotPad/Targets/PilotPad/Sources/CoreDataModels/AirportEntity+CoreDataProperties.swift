//
//  AirportEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
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
    @NSManaged public var latittude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    @NSManaged public var reference: String?
    @NSManaged public var utc_offset: Date?
    @NSManaged public var variation: String?
    @NSManaged public var approaches: NSSet?
    @NSManaged public var arrival_stars: NSSet?
    @NSManaged public var departure_sids: NSSet?
    @NSManaged public var holding_waypoints: NSSet?
    @NSManaged public var runways: NSSet?

}

// MARK: Generated accessors for approaches
extension AirportEntity {

    @objc(addApproachesObject:)
    @NSManaged public func addToApproaches(_ value: AirportApproachEntity)

    @objc(removeApproachesObject:)
    @NSManaged public func removeFromApproaches(_ value: AirportApproachEntity)

    @objc(addApproaches:)
    @NSManaged public func addToApproaches(_ values: NSSet)

    @objc(removeApproaches:)
    @NSManaged public func removeFromApproaches(_ values: NSSet)

}

// MARK: Generated accessors for arrival_stars
extension AirportEntity {

    @objc(addArrival_starsObject:)
    @NSManaged public func addToArrival_stars(_ value: AirportArrivalSTARSEntity)

    @objc(removeArrival_starsObject:)
    @NSManaged public func removeFromArrival_stars(_ value: AirportArrivalSTARSEntity)

    @objc(addArrival_stars:)
    @NSManaged public func addToArrival_stars(_ values: NSSet)

    @objc(removeArrival_stars:)
    @NSManaged public func removeFromArrival_stars(_ values: NSSet)

}

// MARK: Generated accessors for departure_sids
extension AirportEntity {

    @objc(addDeparture_sidsObject:)
    @NSManaged public func addToDeparture_sids(_ value: AirportDepartureSIDSEntity)

    @objc(removeDeparture_sidsObject:)
    @NSManaged public func removeFromDeparture_sids(_ value: AirportDepartureSIDSEntity)

    @objc(addDeparture_sids:)
    @NSManaged public func addToDeparture_sids(_ values: NSSet)

    @objc(removeDeparture_sids:)
    @NSManaged public func removeFromDeparture_sids(_ values: NSSet)

}

// MARK: Generated accessors for holding_waypoints
extension AirportEntity {

    @objc(addHolding_waypointsObject:)
    @NSManaged public func addToHolding_waypoints(_ value: AirportHoldingWaypointEntity)

    @objc(removeHolding_waypointsObject:)
    @NSManaged public func removeFromHolding_waypoints(_ value: AirportHoldingWaypointEntity)

    @objc(addHolding_waypoints:)
    @NSManaged public func addToHolding_waypoints(_ values: NSSet)

    @objc(removeHolding_waypoints:)
    @NSManaged public func removeFromHolding_waypoints(_ values: NSSet)

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
