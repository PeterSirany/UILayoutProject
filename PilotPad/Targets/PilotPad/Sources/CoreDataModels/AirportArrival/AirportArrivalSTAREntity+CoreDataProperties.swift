//
//  AirportArrivalSTAREntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData


extension AirportArrivalSTAREntity {
	
	@nonobjc public class func fetchRequest() -> NSFetchRequest<AirportArrivalSTAREntity> {
		return NSFetchRequest<AirportArrivalSTAREntity>(entityName: "AirportArrivalSTAREntity")
	}
	
	@NSManaged public var id: String?
	@NSManaged public var initialAltitude: Double
	@NSManaged public var name: String?
	@NSManaged public var descentGradient: ClimbGradientEntity?
	@NSManaged public var waypoints: NSSet?
	
	public struct Keys {
		static let entityName = "AirportArrivalSTAREntity"
		static let initialAltitude = "initialAltitude"
		static let name = "name"
		static let descentGradient = "descentGradient"
		static let waypoints = "waypoints"
	}
	
}

// MARK: Generated accessors for waypoints
extension AirportArrivalSTAREntity {
	
	@objc(addWaypointsObject:)
	@NSManaged public func addToWaypoints(_ value: WaypointEntity)
	
	@objc(removeWaypointsObject:)
	@NSManaged public func removeFromWaypoints(_ value: WaypointEntity)
	
	@objc(addWaypoints:)
	@NSManaged public func addToWaypoints(_ values: NSSet)
	
	@objc(removeWaypoints:)
	@NSManaged public func removeFromWaypoints(_ values: NSSet)
	
}
