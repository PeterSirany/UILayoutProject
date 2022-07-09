//
//  AvailableSTARsView.swift
//  Views
//
//  Created by Richard Poutier on 7/8/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import Models
import Common
import SwiftUI
import ViewModels

public class AvailableSTARsViewModel: ObservableObject {
	@Published public var stars: [AirportArrivalStar]
	public var databaseStars: [AirportArrivalStar]
	
	private let navigationContext: NavigationContextController
	
	public init(existingStars: [AirportArrivalStar], dataStore: DataStore, navigationContext: NavigationContextController) {
		self.stars = existingStars
		self.navigationContext = navigationContext
		self.databaseStars = (try? dataStore.fetchArrivalStars()) ?? []
	}
	
	public func createNew() {
		self.navigationContext.show(view: .newSTAR)
	}
	
	public func starSelected(id: String) {
		guard let star = self.databaseStars.first(where: { $0.id == id }) else { return }
		self.stars.append(star)
	}
}

public struct AvailableSTARsView: View {
	@ObservedObject public var viewModel: AvailableSTARsViewModel
	
	public var body: some View {
		SectionContainer(sectionTitle: "Arrival STARs") {
			VStack(spacing: 10) {
				ForEach(self.viewModel.stars) { departureSid in
					STARItemCellView(star: departureSid)
				}
			}
		} titleAccessoryView: {
			HStack {
				Menu("Add") {
					VStack {
						ForEach(self.viewModel.databaseStars) { star in
							Button(action: { self.viewModel.starSelected(id: star.id) }, label: { Text("\(star.name)") })
						}
					}
				}
				Button(action: { self.viewModel.createNew() }, label: { Text("Create") })
			}
		}
	}
}
