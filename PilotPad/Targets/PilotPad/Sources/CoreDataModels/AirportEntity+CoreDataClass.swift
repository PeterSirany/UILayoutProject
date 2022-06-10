//
//  AirportEntity+CoreDataClass.swift
//  
//
//  Created by Richard Poutier on 6/10/22.
//
//

import Foundation
import CoreData
import Models

@objc(AirportEntity)
public class AirportEntity: NSManagedObject {

	public func toModel() -> Airport? {
		guard let icao = self.icao,
					let iata = self.iata,
					let name = self.name,
					let reference = self.reference,
					let utcOffset = self.utc_offset else {
						return nil
					}
		let airport = Airport()
		airport.icao = icao
		airport.iata = iata
		airport.name = name
		airport.reference = reference
		airport.utcOffset = utcOffset
		airport.latitude = self.latittude
		airport.longitude = self.longitude
		airport.elevation = self.elevation
		airport.variation = self.variation
		airport.runways = self.runways?.compactMap({ ($0 as? AirportRunwayEntity)?.toModel()}) ?? []
		airport.holdingWaypoints = self.holding_waypoints?.compactMap({ ($0 as? AirportHoldingWaypointEntity)?.toModel() }) ?? []
		airport.arrivalSTARS = self.arrival_stars?.compactMap({ ($0 as? AirportArrivalSTARSEntity)?.toModel() }) ?? []
		airport.departureSIDS = self.departure_sids?.compactMap({ ($0 as? AirportDepartureSIDSEntity)?.toModel() }) ?? []
		airport.approaches = self.approaches?.compactMap({ ($0 as? AirportApproachEntity)?.toModel() }) ?? []
		
		return airport
	}
	
	public struct Keys {
		private init() { }
		public static let elevation = "elevation"
		public static let latitude = "latittude"
		public static let longitude = "longitude"
		public static let iata = "iata"
		public static let icao = "icao"
		public static let name = "name"
		public static let reference = "reference"
		public static let variation = "variation"
		public static let utcOffset = "utc_offset"
		public static let approaches = "approaches"
		public static let arrivalStars = "arrival_stars"
		public static let departureSids = "departure_sids"
		public static let holdingWaypoints = "holding_waypoints"
		public static let runways = "runways"
		
	}
}
