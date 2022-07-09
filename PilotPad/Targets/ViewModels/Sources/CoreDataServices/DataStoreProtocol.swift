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
	func save(aircraft: Aircraft) throws
	func save(airport: Airport) throws
	func save(waypoint: Waypoint) throws
	func update(aircraft: Aircraft) throws
	func fetchAirplane() throws -> [Aircraft]
	func fetchAirports() throws -> [Airport]
	func fetchAllWaypoints() throws -> [Waypoint]
	func fetchHeadings() throws -> [Heading]
}
