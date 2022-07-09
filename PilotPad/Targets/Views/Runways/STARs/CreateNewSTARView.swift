//
//  CreateNewSTARView.swift
//  Views
//
//  Created by Richard Poutier on 7/8/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import ViewModels
import Models
import Common
import SwiftUI

public class CreateNewSTARViewModel: ObservableObject {
	private let dataStore: DataStore
	private let navigationContext: NavigationContextController
	
	@Published public var procedureName: String?
	@Published public var altitude: Double?
	@Published public var climbGradientValue: Double?
	@Published public var climbGradientMeasurementType: MeasurementType = .meters
	@Published public var headingValue: String?
	
	public let availableWaypointsViewModel: AvailableWaypointsViewModel
	
	public init(dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navigationContext = navigationContext
		availableWaypointsViewModel = .init(waypointType: .star, waypoints: [],
																				dataStore: self.dataStore, navigationContext: self.navigationContext)
	}
	
	public func save() {
		guard let name = self.procedureName,
					let climbValue = self.climbGradientValue,
					let altitude = self.altitude  else { return }
		
		let star = AirportArrivalStar(
			name: name,
			initialAltitude: altitude,
			waypoints: availableWaypointsViewModel.selectedWaypoints,
			descentGradient: .init(value: climbValue, measurementType: climbGradientMeasurementType))
		do {
			try self.dataStore.save(arrivalStar: star)
			print("Star saved")
		} catch {
			print("Error saving STAR: \(error)")
		}
	}
	
	public func back() {
		self.navigationContext.back()
	}
}


public struct CreateNewSTARView: View {
	@ObservedObject public var viewModel: CreateNewSTARViewModel
	public var body: some View {
		ScrollView {
			getSTARMetadataSection()
			AvailableWaypointsView(viewModel: self.viewModel.availableWaypointsViewModel)
		}
	}
	
	@ViewBuilder
	func getSTARMetadataSection() -> some View {
		SectionContainer(sectionTitle: "STAR Information") {
			VStack(alignment: .leading) {
				HStack {
					SimpleTextField(text: self.$viewModel.procedureName, title: "Name", placeholder: "CASTA ONE")
					SimpleDecimalTextField(value: self.$viewModel.climbGradientValue, title: "Descent Gradient", placeholder: "-350")
					MeasurementTypeSelectorView(selectedMeasurement: self.$viewModel.climbGradientMeasurementType, selectionOptions: [.meters, .feet, .knots])
				}
				HStack {
					SimpleDecimalTextField(value: self.$viewModel.altitude, title: "Initial Altitude", placeholder: "5000")
				}
			}
		} titleAccessoryView: {
			HStack {
				Button(action: { self.viewModel.back() }, label: { Text("Back") } )
				Button(action: { self.viewModel.save() }, label: { Text("Save") } )
			}
		}
	}
}
