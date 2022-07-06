//
//  AirportEntity+CoreDataClass.swift
//
//
//  Created by Richard Poutier on 6/19/22.
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
						let coordinate = self.coordinateString else { return nil }
		guard let variation = self.variation?.toModel() else { return nil }
		let runways = self.runways?.compactMap { ($0 as? AirportRunwayEntity)?.toModel() }
		
		return .init(
			icao: icao,
			iata: iata,
			name: name,
			coordinateString: coordinate,
			elevation: self.elevation,
			variation: variation,
			runways: runways ?? []
		)
	}
	
	public struct Keys {
		private init() { }
		public static let elevation = "elevation"
		public static let coordinateString = "coordinateString"
		public static let iata = "iata"
		public static let icao = "icao"
		public static let name = "name"
		public static let variation = "variation"
		public static let runways = "runways"
	}
}

