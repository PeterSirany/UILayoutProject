//
//  DataStore.swift
//  PilotPad
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import CoreData
import Models
import ViewModels

public class DataStoreImpl: DataStore {
	 
	private let managedObjectContext : NSManagedObjectContext
	
	public init(managedObjectContext : NSManagedObjectContext) {
		self.managedObjectContext = managedObjectContext
	}
	
	public func save(aircraft: Aircraft) throws {
		let managedContext = self.managedObjectContext
		guard let aircraftEntity = NSEntityDescription.insertNewObject(forEntityName: "AircraftEntity", into: managedContext) as? AircraftEntity else {
			print("couldn't create the \(AircraftEntity.Keys.entityName) entity")
			return
		}
		do {
			try self.save(aircraftEntity: aircraftEntity, aircraft: aircraft)
		}
	}
	
	public func update(aircraft: Aircraft) throws {
		guard let id = aircraft.id else { return }
		let context = self.managedObjectContext
		do {
			let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AircraftEntity")
			request.predicate = NSPredicate(format: "id == %@", id as NSString)
			if let aircraftEntity = try context.fetch(request).compactMap({ $0 as? AircraftEntity }).first {
				try self.save(aircraftEntity: aircraftEntity, aircraft: aircraft)
			}
		}
	}
	
	private func save(aircraftEntity: AircraftEntity, aircraft: Aircraft) throws {
		aircraftEntity.setValue(aircraft.id, forKey: AircraftEntity.Keys.id)
		aircraftEntity.setValue(aircraft.registration, forKey: AircraftEntity.Keys.registration)
		aircraftEntity.setValue(aircraft.model, forKey: AircraftEntity.Keys.model)
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
		
		aircraftEntity.setValue(aircraft.maxZeroFuelWeight, forKey: AircraftEntity.Keys.maxZeroFuelWeight)
		aircraftEntity.setValue(aircraft.maxTaxi, forKey: AircraftEntity.Keys.maxTaxi)
		aircraftEntity.setValue(aircraft.maxTakeOffWeight, forKey: AircraftEntity.Keys.maxTakeOffWeight)
		aircraftEntity.setValue(aircraft.maxLandingWeight, forKey: AircraftEntity.Keys.maxLandingWeight)
		aircraftEntity.setValue(aircraft.maxFuelQuantity, forKey: AircraftEntity.Keys.maxFuelQuantity)
		aircraftEntity.setValue(aircraft.maxPressureAltitude, forKey: AircraftEntity.Keys.maxPressureAltitude)
		aircraftEntity.setValue(aircraft.maxFuelDiscrepancy1, forKey: AircraftEntity.Keys.maxFuelDiscrepancy1)
		aircraftEntity.setValue(aircraft.maxFuelDiscrepancy2, forKey: AircraftEntity.Keys.maxFuelDiscrepancy2)
		do {
			try self.managedObjectContext.save()
		}
	}
	
	public func fetchAirplane() throws -> [Aircraft] {
		let context = self.managedObjectContext
		do {
			let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AircraftEntity")
			let fetchRequestResults = try? context.fetch(request).compactMap { $0 as? AircraftEntity }
			let airplanes = fetchRequestResults?.compactMap { $0.toAircraftModel() }
			return airplanes ?? []
		}
	}
}


public protocol Queryable {
		associatedtype Filter: QueryFilter
		init(result: Filter.ResultType)
}

public protocol QueryFilter: Equatable {
		associatedtype ResultType: NSFetchRequestResult
		func fetchRequest(_ dataStore: DataStore) -> NSFetchRequest<ResultType>
}
