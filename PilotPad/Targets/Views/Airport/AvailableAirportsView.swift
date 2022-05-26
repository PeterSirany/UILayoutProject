//
//  AvailableAirportsView.swift
//  Views
//
//  Created by Richard Poutier on 5/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import ViewModels

public struct AvailableAirportsView: View {
	@ObservedObject private var viewModel: AvailableAirportsViewModel
	
	public init(viewModel: AvailableAirportsViewModel) {
		self.viewModel = viewModel
	}
	
	public var body: some View {
		SectionContainer(
			sectionTitle: "Airports",
			contentView: {
				List {
						Text("Hello")
						Text("Hello")
						Text("Hello")
				}
			},
			titleAccessoryView: {
				HStack {
					Button(action: {
						self.viewModel.back()
					}, label: {
						Text("Back")
					})
					Button(action: {
						self.viewModel.createNewAircraft()
					}, label: {
						Text("Create New")
					})
				}
			}
		)
	}
}
