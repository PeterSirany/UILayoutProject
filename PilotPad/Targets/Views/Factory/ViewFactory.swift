//
//  ViewFactory.swift
//  ViewModels
//
//  Created by Richard Poutier on 4/23/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import ViewModels
import Models

public enum ViewFactoryView: Identifiable, Hashable {
	case availableAircraftList
	case newAircraft(aircraft: Aircraft)
	
	public var id: UUID {
		return UUID()
	}
}

public class ViewFactory {
	private let dataStore: DataStore
	
	public init(dataStore: DataStore) {
		self.dataStore = dataStore
	}
	
	@ViewBuilder
	public func build(_ view: ViewFactoryView) -> some View {
		switch view {
		case .availableAircraftList:
			self.availableAircraftList()
		case .newAircraft(let aircraft):
			self.newAircraft(aircraft)
		}
	}
	
	@ViewBuilder
	func availableAircraftList() -> some View {
		AvailableAircraftView(
			viewModel: .init(dataStore: self.dataStore)
		)
	}
	
	@ViewBuilder
	func newAircraft(_ aircraft: Aircraft) -> some View {
		CreateNewAircraftView(
			viewModel: .init(aircraft: aircraft, dataStore: self.dataStore)
		)
	}
}
