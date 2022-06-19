//
//  Airport.swift
//  Common
//
//  Created by Richard Poutier on 6/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import CoreLocation

public class Airport: CustomStringConvertible, Identifiable, Hashable {
	public let id: UUID = UUID()
	public var icao: String = ""
	public var iata: String = ""
	public var name: String = ""
	public var latitude: CLLocationDegrees = -1
	public var longitude: CLLocationDegrees = -1
	public var elevation: Double = -1
	public var variation: String? = nil
	public var reference: String = ""
	public var utcOffset: Date = .init()
	public var runways: [AirportRunway] = []
	public var holdingWaypoints: [AirportHoldingWaypoint] = []
	public var arrivalSTARS: [AirportArrivalSTARS] = []
	public var departureSIDS: [AirportDepartureSIDS] = []
	public var approaches: [AirportApproach] = []
	
	public init() { }
	
	public var description: String {
		return """
icao: \(icao)
iata: \(iata)
name: \(name)
variation: \(variation ?? "NA")
reference: \(reference)
coordinate: (\(latitude), \(longitude))
elevation: \(elevation)
utcOffset: \(utcOffset)
runways: \(runways.map { $0.description }.joined(separator: " - "))
waypoints: \(holdingWaypoints.map { $0.description }.joined(separator: " - "))
arrivalSTARS: \(arrivalSTARS.map { $0.description }.joined(separator: " - "))
departureSIDS: \(departureSIDS.map { $0.description }.joined(separator: " - "))
approaches: \(approaches.map { $0.description }.joined(separator: " - "))
"""
	}
}

//public class AirportRunway: CustomStringConvertible {
//	public var heading: Double
//	public var length: Double
//	public var name: String
//	
//	public var description: String {
//		return "Runway \(name), heading: \(heading)º, length: \(length)ft"
//	}
//	
//	public init() {
//		self.name = ""
//		self.length = -1
//		self.heading = -1
//	}
//}

public class AirportHoldingWaypoint: CustomStringConvertible {
	public var name: String
	public var fuelBurn: Double
	public var altitude: Double
	
	public var description: String {
		return "Waypoint \(name), fuel: \(fuelBurn), altitude: \(altitude)ft"
	}
	
	public init() {
		name = ""
		fuelBurn = -1
		altitude = -1
	}
}

public class AirportArrivalSTARS: CustomStringConvertible {
	public var name: String
	public var initialAltitude: Double
	public var course: Double
	
	public var description: String {
		return "Arrival \(name), course: \(course)º, initial Altitude: \(initialAltitude)ft"
	}
	
	public init() {
		name = ""
		initialAltitude = -1
		course = -1
	}
}

public class AirportDepartureSIDS: CustomStringConvertible {
	public var name: String
	public var course: Double
	public var altitude: Double
	
	public var description: String {
		return "Departure \(name), course: \(course)º, altitude: \(altitude)ft"
	}
	
	public init() {
		name = ""
		course = -1
		altitude = -1
	}
}

public class AirportApproach: CustomStringConvertible {
	public var name: String
	public var finalCrs: Double
	public var fafAltitude: Double
	
	public var description: String {
		return "Approach \(name), final: \(finalCrs)º, altitude: \(fafAltitude)ft"
	}
	
	public init() {
		name = ""
		finalCrs = -1
		fafAltitude = -1
	}
}

