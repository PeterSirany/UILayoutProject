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
	private let navigationContext: NavigationContextController
	
	public init(existingStars: [AirportArrivalStar], navigationContext: NavigationContextController) {
		self.stars = existingStars
		self.navigationContext = navigationContext
	}
	
	public func createNew() {
		self.navigationContext.show(view: .newSTAR)
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
			Button(action: { self.viewModel.createNew() }, label: { Text("Create") })
		}
	}
}
