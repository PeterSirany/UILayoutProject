//
//  Airport.swift
//  Common
//
//  Created by Richard Poutier on 6/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import CoreLocation

public class Airport {
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
}

public class AirportRunway {
	public var heading: Double
	public var length: Double
	public var name: String
	
	public init() {
		self.name = ""
		self.length = -1
		self.heading = -1
	}
}

public class AirportHoldingWaypoint {
	public var name: String
	public var fuelBurn: Double
	public var altitude: Double
	
	public init() {
		name = ""
		fuelBurn = -1
		altitude = -1
	}
}

public class AirportArrivalSTARS {
	public var name: String
	public var initialAltitude: Double
	public var course: Double
	
	public init() {
		name = ""
		initialAltitude = -1
		course = -1
	}
}

public class AirportDepartureSIDS {
	public var name: String
	public var course: Double
	public var altitude: Double
	
	public init() {
		name = ""
		course = -1
		altitude = -1
	}
}

public class AirportApproach {
	public var name: String
	public var finalCrs: Double
	public var fafAltitude: Double
	
	public init() {
		name = ""
		finalCrs = -1
		fafAltitude = -1
	}
}

