//
//  AirportDepartureSIDSEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData
import Models

@objc(AirportDepartureSIDSEntity)
public class AirportDepartureSIDSEntity: NSManagedObject {

	public func toModel() -> AirportDepartureSIDS? {
		guard let name = self.name else { return nil }
		let departure = AirportDepartureSIDS()
		departure.name = name
		departure.altitude = self.altitude
		departure.course = self.course
		return departure
	}
}
