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
				ZStack {
				List(self.viewModel.airports) { airport in
					AirportItemCellView(
						numberOfRunways: airport.runways.count,
						icao: airport.icao,
						iata: airport.iata,
						name: airport.name
					)
				}
					if self.viewModel.airports.isEmpty {
						Text("Create an airport to get started.")
					}
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
						Text("Create")
					})
				}
			}
		)
	}
}

struct AirportItemCellView: View {
	let numberOfRunways: Int
	let icao: String
	let iata: String
	let name: String
	
	var body: some View {
		HStack(spacing: 25) {
			Text(icao)
				.font(.system(size: 16))
				.foregroundColor(Color.preliminaryTextColor)
			Text(iata)
				.font(.system(size: 16))
				.foregroundColor(Color.preliminaryTextColor)
			Text(name)
				.font(.system(size: 16))
				.foregroundColor(Color.preliminaryTextColor)
			Spacer()
			HStack(spacing: 25) {
				Text("\(numberOfRunways)") // number of runways
					.foregroundColor(Color.preliminaryTextColor)
				Image("arrow-right-icon", bundle: .main)
					.renderingMode(.template)
					.resizable()
					.foregroundColor(Color.preliminaryTextColor)
					.frame(width: 12, height: 12, alignment: .center)
			}
		}.padding(.horizontal)
			.addRoundedCornerStrokeBorder(strokeColor: .preliminaryTextColor, backgroundColor: .darkBackgroundColor)
	}
}

struct AirportItemCellView_Previews: PreviewProvider {
	static var previews: some View {
		AirportItemCellView(
			numberOfRunways: 4,
			icao: "KLAX",
			iata: "LAX",
			name: "Los Angeles International Airport")
	}
}

