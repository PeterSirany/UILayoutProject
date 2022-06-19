//
//  CreateNewAirportView.swift
//  ViewModels
//
//  Created by Richard Poutier on 5/12/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models
import ViewModels

public enum AirportVariation: String {
	case trueVariation
	case magneticVariation
}

public class CreateNewAirportViewModel: ObservableObject {
	private let dataStore: DataStore
	private let navController: NavigationContextController
	
	@Published public var icao: String?
	@Published public var iata: String?
	@Published public var name: String?
	@Published public var latLong: String?
	@Published public var elevation: String?
	@Published public var variation: String?
	
	public init(dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navController = navigationContext
	}
	
	func save() {
		let airport = Airport()
		airport.iata = "LAX"
		airport.icao = "KLAX"
		airport.name = "Los Angeles International Airport"
		airport.latitude = 33.9424964
		airport.longitude = -118.4080486
		airport.elevation = 127.8
		airport.variation = "12E"
		airport.reference = "True"
		airport.utcOffset = .now
		
		// runways
		let runway25L = AirportRunway()
		runway25L.heading = 71
		runway25L.length = 11095
		runway25L.name = "25L"
		let runway24R = AirportRunway()
		runway24R.heading = 71
		runway24R.length = 8926
		runway24R.name = "24R"
		airport.runways = [runway24R, runway25L]
		
		// holding waypoint
		let waypoint = AirportHoldingWaypoint()
		waypoint.name = "IMPED"
		waypoint.fuelBurn = 1500
		waypoint.altitude = 12000
		airport.holdingWaypoints = [waypoint]
		
		// arrival STARS
		let arrival = AirportArrivalSTARS()
		arrival.course = 267
		arrival.initialAltitude = 12000
		arrival.name = "CHUWY1"
		airport.arrivalSTARS = [arrival]
		
		// departure SIDS
		let departure = AirportDepartureSIDS()
		departure.course = 119
		departure.altitude = 4000
		departure.name = "RIDAP5"
		airport.departureSIDS = [departure]
		
		// approaches
		let approach = AirportApproach()
		approach.name = "ISL 12L"
		approach.finalCrs = 119
		approach.fafAltitude = 2000
		airport.approaches = [approach]
		do {
			try self.dataStore.save(airport: airport)
		} catch {
			print("Error saving airport: \(error)")
		}
	}
}

public struct CreateNewAirportView: View {
	@ObservedObject private var viewModel: CreateNewAirportViewModel
	
	public init(viewModel: CreateNewAirportViewModel) {
		self.viewModel = viewModel
	}
	
	public var body: some View {
		ScrollView {
			getMetadataInputs()
		}
	}
	
	@ViewBuilder
	func getMetadataInputs() -> some View {
		SectionContainer(sectionTitle: "Data Sets") {
			VStack(alignment: .leading) {
				HStack {
					SimpleTextField(text: self.$viewModel.icao, title: "ICAO", placeholder: "KLAX")
					SimpleTextField(text: self.$viewModel.iata, title: "IATA", placeholder: "LAX")
					SimpleTextField(text: self.$viewModel.variation, title: "Variation", placeholder: "12E")
				}
				HStack {
					SimpleTextField(text: self.$viewModel.name, title: "Name", placeholder: "Airport Name")
					SimpleTextField(text: self.$viewModel.latLong, title: "Lat/Lng", placeholder: "N3220.5E11845.5")
					SimpleTextField(text: self.$viewModel.elevation, title: "Elevation", placeholder: "143")
				}
			}
		} titleAccessoryView: {
			Button(action: { self.viewModel.save() }, label: { Text("Create") })
		}

	}
}
