//
//  AvailableWaypointsView.swift
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


public class AvailableWaypointsViewModel: ObservableObject {
	@Published var waypoints: [Waypoint]
	@Published public var selectedWaypoints: [Waypoint]
	private let navigationContext: NavigationContextController
	private let waypointType: WaypointType
	private let dataStore: DataStore
	
	public init(waypointType: WaypointType, waypoints: [Waypoint], dataStore: DataStore, navigationContext: NavigationContextController) {
		self.waypointType = waypointType
		self.selectedWaypoints = waypoints
		self.dataStore = dataStore
		self.navigationContext = navigationContext
		self.waypoints = (try? dataStore.fetchAllWaypoints()) ?? []
		print("self.waypoints.count -> \(self.waypoints.count)")
	}
	
	public func createNewWaypoint() {
		self.navigationContext.show(view: .newWaypoint(type: waypointType))
	}
	
	public func waypointSelected(waypointId: String) {
		guard let waypoint = self.waypoints.first(where: { $0.id == waypointId }) else { return }
		self.selectedWaypoints.append(waypoint)
	}
}

public struct AvailableWaypointsView: View {
	@ObservedObject var viewModel: AvailableWaypointsViewModel
	
	public var body: some View {
		SectionContainer(sectionTitle: "Waypoints") {
			VStack {
				ForEach(self.viewModel.selectedWaypoints) { waypoint in
					WaypointItemCellView(waypoint: waypoint)
				}
			}
		} titleAccessoryView: {
			HStack {
				Menu("Add") {
					VStack {
						ForEach(self.$viewModel.waypoints) { waypoint in
							Button(action: { self.viewModel.waypointSelected(waypointId: waypoint.wrappedValue.id) }, label: { Text("\(waypoint.wrappedValue.name)") })
						}
					}
				}
				Button(action: { self.viewModel.createNewWaypoint() }, label: { Text("Create") })
			}
		}

	}
}
