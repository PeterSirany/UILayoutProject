//
//  ViewFactory.swift
//  ViewModels
//
//  Created by Richard Poutier on 4/23/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models
import ViewModels

public class ViewFactory {
	private let dataStore: DataStore
	private let navigationContext: NavigationContextController
	
	public init(dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navigationContext = navigationContext
	}
	
	@ViewBuilder
	public func build(_ view: ViewFactoryView) -> some View {
		switch view {
		case .availableAircraftList:
			self.availableAircraftList()
		case .availableAirportsList:
			self.availableAirportsList()
		case .newAircraft(let aircraft):
			self.aircraft(aircraft, newAircraft: true)
		case .existingAircraft(let aircraft):
			self.aircraft(aircraft, newAircraft: false)
		case .mainMenu:
			self.mainMenu()
		case .newAirport:
			self.newAirport()
		}
	}
	
	@ViewBuilder
	func newAirport() -> some View {
		CreateNewAirportView(
			viewModel: .init(dataStore: self.dataStore, navigationContext: self.navigationContext)
		)
	}
	@ViewBuilder
	func availableAircraftList() -> some View {
		AvailableAircraftView(
			viewModel: .init(dataStore: self.dataStore, navigationContext: self.navigationContext)
		)
	}
	@ViewBuilder
	func availableAirportsList() -> some View {
		AvailableAirportsView(viewModel: .init(dataStore: self.dataStore, navigationContext: self.navigationContext))
	}
	
	@ViewBuilder
	func aircraft(_ aircraft: Aircraft, newAircraft: Bool) -> some View {
		CreateNewAircraftView(
			viewModel: .init(aircraft: aircraft, newAircraft: newAircraft, dataStore: self.dataStore, navigationContext: navigationContext)
		)
	}
	
	@ViewBuilder
	func mainMenu() -> some View {
		MainMenuView(navigationContext: navigationContext)
	}
}
