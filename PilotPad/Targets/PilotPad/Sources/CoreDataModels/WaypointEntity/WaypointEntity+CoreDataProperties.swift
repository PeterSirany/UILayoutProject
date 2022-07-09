//
//  WaypointEntity+CoreDataProperties.swift
//  
//
//  Created by Richard Poutier on 6/18/22.
//
//

import Foundation
import CoreData


extension WaypointEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WaypointEntity> {
        return NSFetchRequest<WaypointEntity>(entityName: "WaypointEntity")
    }

    @NSManaged public var altitude: Double
    @NSManaged public var coordinateString: String?
    @NSManaged public var name: String?
    @NSManaged public var speed: Double
    @NSManaged public var type: String?
    @NSManaged public var variation: HeadingEntity?

}

extension WaypointEntity {
	public struct Keys {
		static let entityName = "WaypointEntity"
		static let altitude = "altitude"
		static let coordinateString = "coordinateString"
		static let name = "name"
		static let speed = "speed"
		static let type = "type"
		static let variation = "variation"
	}
}
