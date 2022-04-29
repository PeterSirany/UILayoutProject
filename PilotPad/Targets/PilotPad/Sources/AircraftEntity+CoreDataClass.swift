//
//  AircraftEntity+CoreDataClass.swift
//  PilotPad
//
//  Created by Richard Poutier on 4/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//
//

import Foundation
import CoreData
import Models

@objc(AircraftEntity)
public class AircraftEntity: NSManagedObject {

	public func toAircraftModel() -> Aircraft {
		let aircraft = Aircraft()
		aircraft.id = self.id
		aircraft.type = self.type
		aircraft.registration = self.registration
		aircraft.model = self.model
		aircraft.emptyWeight = self.emptyWeight
		aircraft.taxiFuelFlow = self.taxiFuelFlow
		aircraft.climbSpeed = Int(self.climbSpeed)
		aircraft.descentSpeed = Int(self.descentSpeed)
		aircraft.holdingSpeed = Int(self.holdingSpeed)
		
		aircraft.tasCalibration = self.tasCalibration
		aircraft.etopsEnabled = self.etopsEnabled
		aircraft.etopsTime = Int(self.etopsTime)
		aircraft.etopsSpeed = self.etopsSpeed
		aircraft.restOperationsEnabled = self.restOperationsEnabled
		
		aircraft.centerAndWingTipTanks = self.centerAndWingTipTanks
		aircraft.fuelJettisonSystem = self.fuelJettisonSystem
		aircraft.singlePointRefueling = self.singlePointRefueling
		aircraft.flightPlansZfwFuelCorrection = self.flightPlansZfwFuelCorrection
		aircraft.weatherRadarSystem = self.weatherRadarSystem
		aircraft.autobreakSystem = self.autobreakSystem
		
		aircraft.leftTankCapacity = self.leftTankCapacity
		aircraft.rightTankCapacity = self.rightTankCapacity
		aircraft.leftWingTipTankCapacity = self.leftWingTipTankCapacity
		aircraft.centerWingTipTankCapacity = self.centerWingTipTankCapacity
		aircraft.rightWingTipTankCapacity = self.rightWingTipTankCapacity
		aircraft.radarBeamWidth = self.radarBeamWidth
		
		// not stored yet
		aircraft.apchSpeed = nil
		aircraft.flaps = []
		aircraft.airspeedUnits = .kts
		aircraft.fuelUnits = .lbs
		
		aircraft.maxZeroFuelWeight = self.maxZeroFuelWeight
		aircraft.maxTaxi = self.maxTaxi
		aircraft.maxTakeOffWeight = self.maxTakeOffWeight
		aircraft.maxLandingWeight = self.maxLandingWeight
		aircraft.maxFuelQuantity = self.maxFuelQuantity
		aircraft.maxPressureAltitude = self.maxPressureAltitude
		aircraft.maxFuelDiscrepancy1 = self.maxFuelDiscrepancy1
		aircraft.maxFuelDiscrepancy2 = self.maxFuelDiscrepancy2
		
		return aircraft
	}
}
