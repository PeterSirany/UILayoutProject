//
//  CreateNewSIDView.swift
//  Views
//
//  Created by Richard Poutier on 6/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import ViewModels
import Models
import Common
import SwiftUI

public class CreateNewSIDViewModel: ObservableObject {
	private let dataStore: DataStore
	private let navigationContext: NavigationContextController
	
	@Published public var procedureName: String?
	@Published public var climbGradientValue: Double?
	@Published public var climbGradientMeasurementType: MeasurementType = .meters
	@Published public var headingValue: String?
	
	public init(dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navigationContext = navigationContext
	}
	
	public func save() {
		
	}
	
	public func back() {
		self.navigationContext.back()
	}
	
	public var availableWaypointsViewModel: AvailableWaypointsViewModel {
		return .init(waypointType: .sid, waypoints: [],
								 dataStore: self.dataStore, navigationContext: self.navigationContext)
	}
}


public struct CreateNewSIDView: View {
	@ObservedObject public var viewModel: CreateNewSIDViewModel
	public var body: some View {
		ScrollView {
			getSIDMetadataSection()
			AvailableWaypointsView(viewModel: self.viewModel.availableWaypointsViewModel)
		}
	}
	
	@ViewBuilder
	func getSIDMetadataSection() -> some View {
		SectionContainer(sectionTitle: "SID Information") {
			HStack {
				SimpleTextField(text: self.$viewModel.procedureName, title: "Name", placeholder: "CASTA ONE")
				SimpleDecimalTextField(value: self.$viewModel.climbGradientValue, title: "Required Climb Gradient", placeholder: "350")
				MeasurementTypeSelectorView(selectedMeasurement: self.$viewModel.climbGradientMeasurementType, selectionOptions: [.meters, .feet, .knots])
			}
		} titleAccessoryView: {
			HStack {
				Button(action: { self.viewModel.back() }, label: { Text("Back") } )
				Button(action: { self.viewModel.save() }, label: { Text("Save") } )
			}
		}
	}
}
