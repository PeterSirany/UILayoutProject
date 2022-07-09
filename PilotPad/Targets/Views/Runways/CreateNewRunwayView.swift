//
//  CreateNewRunwayView.swift
//  Views
//
//  Created by Richard Poutier on 6/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models
import ViewModels

public class CreateNewAirportRunwayViewModel: ObservableObject {
	private let dataStore: DataStore
	private let navigationContext: NavigationContextController
	
	@Published public var name: String?
	@Published public var length: Double?
	@Published public var touchDownZoneElevation: Double?
	@Published public var heading: String?
	@Published public var displacedThresholdValue: Double?
	@Published public var displacedThresholdUnits: MeasurementType = .feet
	@Published public var departureSids: [AirportDepartureSid]?
	@Published public var intersections: [RunwayIntersection]?
	
	public init(dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navigationContext = navigationContext
	}
	
	public func save() {
		
	}
	public func back() {
		self.navigationContext.back()
	}
	
	public var availableSidsViewModel: AvailableSIDsViewModel {
		return .init(existingSids: [
			.init(name: "CASTA ONE", waypoints: [], climbGradient: .init(value: 112, measurementType: .feet), initialRunwayHeading: .init(value: "120", variation: nil))
		], dataStore: self.dataStore, navigationContext: self.navigationContext)
	}
	
	public var availableStarsViewModel: AvailableSTARsViewModel {
		return .init(existingStars: [
			.init(name: "FIDEL", initialAltitude: 10000, waypoints: [], descentGradient: .init(value: -120, measurementType: .knots))
		], dataStore: self.dataStore, navigationContext: self.navigationContext)
	}
}


public struct CreateNewRunwayView: View {
	@ObservedObject var viewModel: CreateNewAirportRunwayViewModel
	
	public var body: some View {
		ScrollView {
			buildMetadataView()
			HStack {
				AvailableSIDsView(viewModel: self.viewModel.availableSidsViewModel)
				AvailableSTARsView(viewModel: self.viewModel.availableStarsViewModel)
			}
			
		}
	}
	
	@ViewBuilder
	func buildMetadataView() -> some View {
		SectionContainer(sectionTitle: "Runway") {
			VStack {
				HStack {
					SimpleTextField(text: self.$viewModel.name, title: "Name", placeholder: "12L")
					SimpleTextField(text: self.$viewModel.heading, title: "Heading", placeholder: "120")
					SimpleDecimalTextField(value: self.$viewModel.touchDownZoneElevation, title: "TDZ Elevation", placeholder: "115")
				}
				HStack {
					SimpleDecimalTextField(value: self.$viewModel.length, title: "Length", placeholder: "4000")
					SimpleDecimalTextField(value: self.$viewModel.displacedThresholdValue, title: "Displaced THR", placeholder: "123")
					MeasurementTypeSelectorView(selectedMeasurement: self.$viewModel.displacedThresholdUnits, selectionOptions: [.feet, .meters])
				}
			}
		} titleAccessoryView: {
			HStack {
				Button(action: { self.viewModel.back() }, label: { Text("Back") })
				Button(action: { self.viewModel.save() }, label: { Text("Save") })
			}
		}
	}
}

struct RunwayMetadataInputView: View {
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				
			}
			HStack {
				
			}
		}
	}
}
