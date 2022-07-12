//
//  AvailableRunwaysView.swift
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

public class AvailableRunwaysViewModel: ObservableObject {
	private let dataStore: DataStore
	private let navigationContext: NavigationContextController
	
	@Published public var runways: [AirportRunway]
	@Published public var databaseRunways: [AirportRunway]
	
	public init(existingRunways: [AirportRunway], dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navigationContext = navigationContext
		self.runways = existingRunways
		self.databaseRunways = (try? dataStore.fetchAirportRunways()) ?? []
	}
	
	func create() {
		self.navigationContext.show(view: .newRunway)
	}
	
	func back() {
		self.navigationContext.back()
	}
	
	public func addRunway(_ id: String) {
		guard let runway = self.databaseRunways.first(where: { $0.id == id }) else { return }
		self.runways.append(runway)
	}
	
}

public struct AvailableRunwaysView: View {
	@ObservedObject public var viewModel: AvailableRunwaysViewModel
	
	public var body: some View {
		SectionContainer(sectionTitle: "Runways") {
			VStack {
				ForEach(viewModel.runways) { runway in
					RunwayItemCellView(runway: runway)
						.borderedCell()
				}
			}
		} titleAccessoryView: {
			HStack {
				Menu("Add") {
					VStack {
						ForEach(self.viewModel.databaseRunways) { runway in
							Button(action: { self.viewModel.addRunway(runway.id) }, label: { Text("\(runway.name)") })
						}
					}
				}
				Button(action: { self.viewModel.back() }, label: { Text("Back") })
				Button(action: { self.viewModel.create() }, label: { Text("Create") })
			}
		}
	}
}

