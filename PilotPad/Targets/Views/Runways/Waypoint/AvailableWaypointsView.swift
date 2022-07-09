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
	private let navigationContext: NavigationContextController
	private let waypointType: WaypointType
	private let dataStore: DataStore
	
	public init(waypointType: WaypointType, waypoints: [Waypoint], dataStore: DataStore, navigationContext: NavigationContextController) {
		self.waypointType = waypointType
		self.waypoints = waypoints
		self.dataStore = dataStore
		self.navigationContext = navigationContext
		let allPoints = try? dataStore.fetchAllWaypoints()
		print("Waypoint count: \(allPoints?.count ?? -1)")
		let headings = try? dataStore.fetchHeadings()
		print("Headings count: \(headings?.count ?? -1)")
	}
	
	public func createNewWaypoint() {
		self.navigationContext.show(view: .newWaypoint(type: waypointType))
	}
}

public struct AvailableWaypointsView: View {
	@ObservedObject var viewModel: AvailableWaypointsViewModel
	
	public var body: some View {
		SectionContainer(sectionTitle: "Waypoints") {
			VStack {
				ForEach(self.viewModel.waypoints) { waypoint in
					WaypointItemCellView(waypoint: waypoint)
				}
			}
		} titleAccessoryView: {
			HStack {
				Button(action: { self.viewModel.createNewWaypoint() }, label: { Text("Create") })
			}
		}

	}
}
