//
//  AirportRunwayEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData
import Models

@objc(AirportRunwayEntity)
public class AirportRunwayEntity: NSManagedObject {

	public func toModel() -> AirportRunway? {
		guard let name = self.name else { return nil }
		let runway = AirportRunway()
		runway.name = name
		runway.length = self.length
		runway.heading = self.heading
		return runway
	}
}
