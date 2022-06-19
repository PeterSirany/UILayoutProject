//
//  Airport.swift
//  Common
//
//  Created by Richard Poutier on 6/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import CoreLocation

public class Airport: Viewable {
	public let icao: String
	public let iata: String
	public let name: String
	public	let coordinateString: String
	public let elevation: Double
	public let variation: Heading
	public let runways: [AirportRunway]
	
	public init(icao: String, iata: String, name: String, coordinateString: String, elevation: Double, variation: Heading, runways: [AirportRunway]) {
		self.icao = icao
		self.iata = iata
		self.name = name
		self.coordinateString = coordinateString
		self.elevation = elevation
		self.variation = variation
		self.runways = runways
	}
	
	public var description: String {
		return """
icao: \(icao)
iata: \(iata)
name: \(name)
variation: \(variation)
coordinate: (\(coordinateString))
elevation: \(elevation)
runways: \(runways.map { $0.description }.joined(separator: " - "))
"""
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(icao)
		hasher.combine(iata)
		hasher.combine(name)
		hasher.combine(coordinateString)
		hasher.combine(elevation)
		hasher.combine(variation)
		hasher.combine(runways)
	}
	
	public static func == (lhs: Airport, rhs: Airport) -> Bool {
		return lhs.icao == rhs.icao
		&& lhs.iata == rhs.iata
		&& lhs.name == rhs.name
		&& lhs.coordinateString == rhs.coordinateString
		&& lhs.elevation == rhs.elevation
		&& lhs.variation == rhs.variation
		&& lhs.runways == rhs.runways
	}
}

