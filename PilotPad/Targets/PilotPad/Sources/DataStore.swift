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
		do {
			try managedContext.save()
		}
	}
	
	public func fetchAirplane() throws {
		let context = self.managedObjectContext
		do {
			let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AircraftEntity")
			let fetchRequestResults = try context.fetch(request).compactMap { $0 as? AircraftEntity }
			print("Result: \(fetchRequestResults.count)")
			let airplanes = fetchRequestResults.map { $0.toAircraftModel() }
			print("Fetched Airplanes:")
			print("    Quantity: \(airplanes.count)")
			print("--- Raw Data ---")
			airplanes.forEach({ print("\($0.self)\n") })
		} catch {
			print("Fetch error: \(error.localizedDescription)")
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
