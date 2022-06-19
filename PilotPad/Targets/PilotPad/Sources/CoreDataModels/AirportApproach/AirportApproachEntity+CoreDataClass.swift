//
//  AirportApproachEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData
import Models

@objc(AirportApproachEntity)
public class AirportApproachEntity: NSManagedObject {

	public func toModel() -> AirportApproach? {
		guard let name = self.name else {
			return nil
		}
		let approach = AirportApproach()
		approach.name = name
		approach.finalCrs = self.final_crs
		approach.fafAltitude = self.faf_altitude
		return approach
	}
}
