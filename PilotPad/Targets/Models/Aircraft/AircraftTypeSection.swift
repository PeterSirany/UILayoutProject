//
//  AircraftTypeSection.swift
//  ViewModels
//
//  Created by Richard Poutier on 4/23/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public class AircraftTypeSection: Identifiable, Hashable {
	public init(aircraftType: String? = nil, airplanes: [Aircraft]) {
		self.aircraftType = aircraftType
		self.airplanes = airplanes
	}
	
	public let id = UUID()
	public var aircraftType: String?
	public var airplanes: [Aircraft]
	
	public static func == (lhs: AircraftTypeSection, rhs: AircraftTypeSection) -> Bool {
		return lhs.aircraftType == rhs.aircraftType && lhs.id == rhs.id && lhs.airplanes == rhs.airplanes
	}
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(aircraftType)
		hasher.combine(airplanes)
	}
}
