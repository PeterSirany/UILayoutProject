//
//  AvailableDatabasesViewModel.swift
//  Views
//
//  Created by Richard Poutier on 5/12/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models

public class AvailableDatabasesViewModel: ObservableObject {
	public enum DatabaseType: String {
		case airports
		case aircraft
		case waypoints
		case passengers
		case notes
	}
	private let navController: NavigationContextController
	
	public init(navigationContext: NavigationContextController) {
		self.navController = navigationContext
	}
	
	public func databaseSelected(_ type: DatabaseType) {
		switch type {
		case .airports:
			self.navController.show(view: .availableAirportsList)
		case .aircraft:
			self.navController.show(view: .availableAircraftList)
		case .waypoints:
			print("unimplemented")
			break
		case .passengers:
			print("unimplemented")
			break
		case .notes:
			print("unimplemented")
			break
		}
		
	}
}
