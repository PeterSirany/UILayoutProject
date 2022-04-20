//
//  Aircraft.swift
//  Common
//
//  Created by Richard Poutier on 4/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public class Aircraft: ObservableObject, CustomStringConvertible {
	@Published public var type: String?
	@Published public var registration: String?
	@Published public var model: String?
	@Published public var emptyWeight: Double?
	@Published public var taxiFuelFlow: Double?
	@Published public var climbSpeed: Int?
	@Published public var descentSpeed: Int?
	@Published public var holdingSpeed: Int?
	@Published public var apchSpeed: Int?
	
	@Published public var tasCalibration: Double = 0.5
	@Published public var etopsEnabled: Bool = false
	@Published public var etopsTime: Int?
	@Published public var etopsSpeed: Double?
	@Published public var restOperationsEnabled: Bool = false
	
	@Published public var flaps: [FlapsSpeedSetting] = []
	@Published public var airspeedUnits: AirspeedUnits = .kts
	@Published public var fuelUnits: AircraftFuelUnits = .lbs
	
	@Published public var centerAndWingTipTanks: Bool = false
	@Published public var fuelJettisonSystem: Bool = false
	@Published public var singlePointRefueling: Bool = false
	@Published public var flightPlansZfwFuelCorrection: Bool = false
	@Published public var weatherRadarSystem: Bool = false
	@Published public var autobreakSystem: Bool = false
	
	@Published public var leftTankCapacity: Double?
	@Published public var rightTankCapacity: Double?
	@Published public var leftWingTipTankCapacity: Double?
	@Published public var centerWingTipTankCapacity: Double?
	@Published public var rightWingTipTankCapacity: Double?
	@Published public var radarBeamWidth: Double?
	
	public init() {
		print("Aircraft initialized")
	}
	
	public var description: String {
		return """
------ Aircraft ------
type = \(self.type ?? "")
registration = \(self.registration ?? "")
model = \(self.model ?? "")
emptyWeight = \(self.emptyWeight ?? 0)
taxiFuelFlow = \(self.taxiFuelFlow ?? 0)
climbSpeed = \(self.climbSpeed ?? 0)
descentSpeed = \(self.descentSpeed ?? 0)
holdingSpeed = \(self.holdingSpeed ?? 0)
apchSpeed = \(self.apchSpeed ?? 0)
 
tasCalibration = \(self.tasCalibration)
etopsEnabled = \(self.etopsEnabled)
etopsTime = \(self.etopsTime ?? 0)
etopsSpeed = \(self.etopsSpeed ?? 0)
restOperationsEnabled = \(self.restOperationsEnabled)
 
flaps: [FlapsSpeedSetting] = []
airspeedUnits: AirspeedUnits = .kts
fuelUnits: AircraftFuelUnits = .lbs
 
centerAndWingTipTanks  = \(self.centerAndWingTipTanks)
fuelJettisonSystem = \(self.fuelJettisonSystem)
singlePointRefueling = \(self.singlePointRefueling)
flightPlansZfwFuelCorrection = \(self.flightPlansZfwFuelCorrection)
weatherRadarSystem = \(self.weatherRadarSystem)
autobreakSystem = \(self.autobreakSystem)
 
 leftTankCapacity = \(self.leftTankCapacity ?? 0)
 rightTankCapacity = \(self.rightTankCapacity ?? 0)
 leftWingTipTankCapacity = \(self.leftWingTipTankCapacity ?? 0)
 centerWingTipTankCapacity = \(self.centerWingTipTankCapacity ?? 0)
 rightWingTipTankCapacity = \(self.rightWingTipTankCapacity ?? 0)
 radarBeamWidth = \(self.radarBeamWidth ?? 0)
------ End ------
"""
	}
}
