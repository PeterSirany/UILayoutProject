//
//  CreateNewWaypointView.swift
//  Views
//
//  Created by Richard Poutier on 6/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models
import Common
import ViewModels

public class CreateNewWaypointViewModel: ObservableObject {
	private let dataStore: DataStore
	private let navigationContext: NavigationContextController
	private let waypointType: WaypointType
	
	@Published public var name: String?
	@Published public var coordinateString: String?
	@Published public var variationValue: String?
	@Published public var altitude: Double?
	@Published public var speed: Double?
	@Published public var isHoldingWaypoint: Bool = false
	
	public var didCreateNewWaypoint: ((Waypoint) -> Void)?
	
	public init(waypointType: WaypointType, dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navigationContext = navigationContext
		self.waypointType = waypointType
	}
	
	func create() {
		guard let name = name,
					let coordinateString = self.coordinateString else { return }
		let waypoint = Waypoint(
			name: name,
			coordinateRepresentation: coordinateString,
			variation: nil,
			type: isHoldingWaypoint ? .holding : self.waypointType,
			altitude: self.altitude,
			speed: self.speed)
		do {
			try self.dataStore.save(waypoint: waypoint)
			self.didCreateNewWaypoint?(waypoint)
			self.navigationContext.back()
		} catch let error {
			print("Unable to save Waypoint: \(error)")
		}
	}
	
	func back() {
		self.navigationContext.back()
	}
}

public struct CreateNewWaypointView: View {
	@ObservedObject public var viewModel: CreateNewWaypointViewModel
	
	public var body: some View {
		SectionContainer(sectionTitle: "New Waypoint") {
			VStack(alignment: .leading) {
				HStack {
					SimpleTextField(text: self.$viewModel.name, title: "Name", placeholder: "PPRRY")
					SimpleTextField(text: self.$viewModel.variationValue, title: "Variation", placeholder: "12E (optional)")
					SimpleDecimalTextField(value: self.$viewModel.altitude, title: "Altitude", placeholder: "520 (opt.)")
					SimpleDecimalTextField(value: self.$viewModel.speed, title: "Speed", placeholder: "210 (opt.)")
				}
				HStack {
					SimpleTextField(text: self.$viewModel.coordinateString, title: "Lat/Lon Coordinate", placeholder: "N45.51W040.25").frame(minWidth: 200)
					Spacer()
					Toggle(isOn: self.$viewModel.isHoldingWaypoint, label: { Text("Holding Waypoint") })
				}
			}
		} titleAccessoryView: {
			HStack {
				Button(action: { self.viewModel.back() }, label: { Text("Back") })
				Button(action: { self.viewModel.create() }, label: { Text("Save") })
			}
		}
	}
}
