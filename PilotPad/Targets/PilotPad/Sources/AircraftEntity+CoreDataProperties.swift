//
//  AircraftEntity+CoreDataProperties.swift
//  PilotPad
//
//  Created by Richard Poutier on 4/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//
//

import Foundation
import CoreData
import Models

extension AircraftEntity {
	
	@nonobjc public class func fetchRequest() -> NSFetchRequest<AircraftEntity> {
		return NSFetchRequest<AircraftEntity>(entityName: "AircraftEntity")
	}
	
	@NSManaged public var autobreakSystem: Bool
	@NSManaged public var centerAndWingTipTanks: Bool
	@NSManaged public var centerWingTipTankCapacity: Double
	@NSManaged public var climbSpeed: Int16
	@NSManaged public var descentSpeed: Int16
	@NSManaged public var emptyWeight: Double
	@NSManaged public var etopsEnabled: Bool
	@NSManaged public var etopsSpeed: Double
	@NSManaged public var etopsTime: Int16
	@NSManaged public var flightPlansZfwFuelCorrection: Bool
	@NSManaged public var fuelJettisonSystem: Bool
	@NSManaged public var holdingSpeed: Double
	@NSManaged public var leftTankCapacity: Double
	@NSManaged public var leftWingTipTankCapacity: Double
	@NSManaged public var model: String?
	@NSManaged public var radarBeamWidth: Double
	@NSManaged public var registration: String?
	@NSManaged public var restOperationsEnabled: Bool
	@NSManaged public var rightTankCapacity: Double
	@NSManaged public var rightWingTipTankCapacity: Double
	@NSManaged public var singlePointRefueling: Bool
	@NSManaged public var tasCalibration: Double
	@NSManaged public var taxiFuelFlow: Double
	@NSManaged public var type: String?
	@NSManaged public var weatherRadarSystem: Bool
	
	
	public struct Keys {
		private init() {}
		public static let entityName = "AircraftEntity"
		public static let model = "model"
		public static let registration = "registration"
		public static let type = "type"
		public static let emptyWeight = "emptyWeight"
		public static let rightWingTipTankCapacity = "rightWingTipTankCapacity"
		public static let restOperationsEnabled = "restOperationsEnabled"
		public static let etopsSpeed = "etopsSpeed"
		public static let etopsTime = "etopsTime"
		public static let etopsEnabled = "etopsEnabled"
		public static let tasCalibration = "tasCalibration"
		public static let radarBeamWidth = "radarBeamWidth"
		public static let holdingSpeed = "holdingSpeed"
		public static let descentSpeed = "descentSpeed"
		public static let climbSpeed = "climbSpeed"
		public static let taxiFuelFlow = "taxiFuelFlow"
		public static let centerWingTipTankCapacity = "centerWingTipTankCapacity"
		public static let leftWingTipTankCapacity = "leftWingTipTankCapacity"
		public static let rightTankCapacity = "rightTankCapacity"
		public static let leftTankCapacity = "leftTankCapacity"
		public static let autobreakSystem = "autobreakSystem"
		public static let weatherRadarSystem = "weatherRadarSystem"
		public static let flightPlansZfwFuelCorrection = "flightPlansZfwFuelCorrection"
		public static let singlePointRefueling = "singlePointRefueling"
		public static let fuelJettisonSystem = "fuelJettisonSystem"
		public static let centerAndWingTipTanks = "centerAndWingTipTanks"
	}
	
	public static func fromAircraft(_ aircraft: Aircraft, context: NSManagedObjectContext) -> NSManagedObject {
		let entity = NSEntityDescription.entity(forEntityName: AircraftEntity.Keys.entityName, in: context)!
//		let aircraftEntity = AircraftEntity(entity: entity, insertInto: context)
		let aircraftEntity = NSManagedObject.init(entity: entity, insertInto: context)
		aircraftEntity.setValue(aircraft.model, forKey: AircraftEntity.Keys.model)
		aircraftEntity.setValue(aircraft.registration, forKey: AircraftEntity.Keys.registration)
		aircraftEntity.setValue(aircraft.type, forKey: AircraftEntity.Keys.type)
		aircraftEntity.setValue(aircraft.emptyWeight, forKey: AircraftEntity.Keys.emptyWeight)
		aircraftEntity.setValue(aircraft.rightWingTipTankCapacity, forKey: AircraftEntity.Keys.rightWingTipTankCapacity)
		aircraftEntity.setValue(aircraft.restOperationsEnabled, forKey: AircraftEntity.Keys.restOperationsEnabled)
		aircraftEntity.setValue(aircraft.etopsTime, forKey: AircraftEntity.Keys.etopsTime)
		aircraftEntity.setValue(aircraft.etopsSpeed, forKey: AircraftEntity.Keys.etopsSpeed)
		aircraftEntity.setValue(aircraft.etopsEnabled, forKey: AircraftEntity.Keys.etopsEnabled)
		aircraftEntity.setValue(aircraft.tasCalibration, forKey: AircraftEntity.Keys.tasCalibration)
		aircraftEntity.setValue(aircraft.radarBeamWidth, forKey: AircraftEntity.Keys.radarBeamWidth)
		aircraftEntity.setValue(aircraft.holdingSpeed, forKey: AircraftEntity.Keys.holdingSpeed)
		aircraftEntity.setValue(aircraft.descentSpeed, forKey: AircraftEntity.Keys.descentSpeed)
		aircraftEntity.setValue(aircraft.climbSpeed, forKey: AircraftEntity.Keys.climbSpeed)
		aircraftEntity.setValue(aircraft.taxiFuelFlow, forKey: AircraftEntity.Keys.taxiFuelFlow)
		aircraftEntity.setValue(aircraft.centerWingTipTankCapacity, forKey: AircraftEntity.Keys.centerWingTipTankCapacity)
		aircraftEntity.setValue(aircraft.leftWingTipTankCapacity, forKey: AircraftEntity.Keys.leftWingTipTankCapacity)
		aircraftEntity.setValue(aircraft.rightTankCapacity, forKey: AircraftEntity.Keys.rightTankCapacity)
		aircraftEntity.setValue(aircraft.leftTankCapacity, forKey: AircraftEntity.Keys.leftTankCapacity)
		aircraftEntity.setValue(aircraft.autobreakSystem, forKey: AircraftEntity.Keys.autobreakSystem)
		aircraftEntity.setValue(aircraft.weatherRadarSystem, forKey: AircraftEntity.Keys.weatherRadarSystem)
		aircraftEntity.setValue(aircraft.flightPlansZfwFuelCorrection, forKey: AircraftEntity.Keys.flightPlansZfwFuelCorrection)
		aircraftEntity.setValue(aircraft.singlePointRefueling, forKey: AircraftEntity.Keys.singlePointRefueling)
		aircraftEntity.setValue(aircraft.fuelJettisonSystem, forKey: AircraftEntity.Keys.fuelJettisonSystem)
		aircraftEntity.setValue(aircraft.centerAndWingTipTanks, forKey: AircraftEntity.Keys.centerAndWingTipTanks)
		return aircraftEntity
	}
}

extension AircraftEntity : Identifiable {
	
}
