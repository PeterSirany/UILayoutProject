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
	@Published public var airportVariation: HeadingVariation?
	@Published public var airportVariationValue: String?
	@Published public var runways: [AirportRunway]
	
	public init(dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navController = navigationContext
		self.airportVariation = .magneticVariation
		self.runways = []
	}
	
	func save() {
		print("Saving new Airport")
//		let airport = Airport()
//		airport.iata = "LAX"
//		airport.icao = "KLAX"
//		airport.name = "Los Angeles International Airport"
//		airport.latitude = 33.9424964
//		airport.longitude = -118.4080486
//		airport.elevation = 127.8
//		airport.variation = "12E"
//		airport.reference = "True"
//		airport.utcOffset = .now
		
		// runways
//		do {
//			try self.dataStore.save(airport: airport)
//		} catch {
//			print("Error saving airport: \(error)")
//		}
	}
	
	func createNewRunway() {
		
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
			getRunwaysContainerView()
		}
	}
	
	@ViewBuilder
	func getMetadataInputs() -> some View {
		SectionContainer(sectionTitle: "Airport Data Sets") {
			VStack(alignment: .leading) {
				HStack {
					SimpleTextField(text: self.$viewModel.icao, title: "ICAO", placeholder: "KLAX")
					SimpleTextField(text: self.$viewModel.iata, title: "IATA", placeholder: "LAX")
					Spacer()
					VariationInputField(selectedVariation: self.$viewModel.airportVariation, value: self.$viewModel.airportVariationValue)
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
	
	@ViewBuilder
	func getRunwaysContainerView() -> some View {
		SectionContainer(sectionTitle: "Runways") {
			VStack {
				ForEach(viewModel.runways) { runway in
					RunwayItemCellView(runway: runway)
						.borderedCell()
				}
			}
		} titleAccessoryView: {
			Button(action: { self.viewModel.createNewRunway() }, label: { Text("Create") })
		}

	}
}

struct VariationInputField: View {
	@Binding var selectedVariation: HeadingVariation?
	@Binding var value: String?
	
	private var selectedSegment: Binding<Int> { Binding (
		get: { self.selectedVariation == .trueVariation ? 0 : 1},
		set: { self.selectedVariation = $0 == 0 ? .trueVariation : .magneticVariation }
		)
	}
	
	var body: some View {
		HStack {
			SimpleTextField(text: $value, title: "Variation", placeholder: "12E")
			Picker("Variation", selection: selectedSegment) {
				Text("True").tag(0)
				Text("Mag").tag(1)
			}.pickerStyle(.segmented)
		}
	}
}

struct VariationInputField_Previews: PreviewProvider {
	static var previews: some View {
		VariationInputField(selectedVariation: .constant(.magneticVariation), value: .constant("14E"))
	}
}

