//
//  AirportArrivalSTARSEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData
import Models

@objc(AirportArrivalSTARSEntity)
public class AirportArrivalSTARSEntity: NSManagedObject {

	public func toModel() -> AirportArrivalSTARS? {
		guard let name = self.name else { return nil }
		let arrival = AirportArrivalSTARS()
		arrival.name = name
		arrival.initialAltitude = self.initial_altitude
		arrival.course = self.course
		return arrival
	}
}
