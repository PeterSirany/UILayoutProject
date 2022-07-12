//
//  DataStoreProtocol.swift
//  Models
//
//  Created by Richard Poutier on 4/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import Models

public protocol DataStore: AnyObject {
	func save(runway: AirportRunway) throws
	func save(aircraft: Aircraft) throws
	func save(airport: Airport) throws
	func save(waypoint: Waypoint) throws
	func save(arrivalStar: AirportArrivalStar) throws
	func save(departureSid: AirportDepartureSid) throws
	func save(intersection: RunwayIntersection) throws
	func update(aircraft: Aircraft) throws
	
	func fetchAirplane() throws -> [Aircraft]
	func fetchAirports() throws -> [Airport]
	func fetchAirportRunways() throws -> [AirportRunway]
	func fetchAllWaypoints() throws -> [Waypoint]
	func fetchHeadings() throws -> [Heading]
	func fetchArrivalStars() throws -> [AirportArrivalStar]
	func fetchDepartureSids() throws -> [AirportDepartureSid]
}
