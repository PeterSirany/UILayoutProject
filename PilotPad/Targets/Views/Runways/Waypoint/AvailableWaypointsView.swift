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
	
	public init(waypointType: WaypointType, waypoints: [Waypoint], navigationContext: NavigationContextController) {
		self.waypoints = waypoints
		self.navigationContext = navigationContext
		self.waypointType = waypointType
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
