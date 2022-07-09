//
//  AirportDepartureSIDEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData


extension AirportDepartureSIDEntity {
	
	@nonobjc public class func fetchRequest() -> NSFetchRequest<AirportDepartureSIDEntity> {
		return NSFetchRequest<AirportDepartureSIDEntity>(entityName: "AirportDepartureSIDEntity")
	}
	
	@NSManaged public var id: String?
	@NSManaged public var name: String?
	@NSManaged public var initialRunwayHeading: HeadingEntity?
	@NSManaged public var requiredClimbGradient: ClimbGradientEntity?
	@NSManaged public var waypoints: NSSet?
	
}

// MARK: Generated accessors for waypoints
extension AirportDepartureSIDEntity {
	
	@objc(addWaypointsObject:)
	@NSManaged public func addToWaypoints(_ value: WaypointEntity)
	
	@objc(removeWaypointsObject:)
	@NSManaged public func removeFromWaypoints(_ value: WaypointEntity)
	
	@objc(addWaypoints:)
	@NSManaged public func addToWaypoints(_ values: NSSet)
	
	@objc(removeWaypoints:)
	@NSManaged public func removeFromWaypoints(_ values: NSSet)
	
}
