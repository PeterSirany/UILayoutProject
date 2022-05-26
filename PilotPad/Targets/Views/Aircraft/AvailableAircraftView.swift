//
//  AvailableAircraftView.swift
//  Views
//
//  Created by Richard Poutier on 4/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Models
import ViewModels

public struct AvailableAircraftView: View {
	@ObservedObject var viewModel: AvailableAircraftViewModel
	
	public init(viewModel: AvailableAircraftViewModel) {
		self.viewModel = viewModel
	}
	
	public var body: some View {
		SectionContainer(
			sectionTitle: "Aircraft",
			contentView: {
				List(viewModel.sections) { section in
					Section {
						VStack {
							ForEach(section.airplanes) { aircraft in
								Button(action: {
									self.viewModel.aircraftSelected(aircraft)
								}) {
									AircraftItemCellView(aircraft: aircraft)
										.listRowInsets(EdgeInsets())
										.listRowSeparator(.hidden)
								}.buttonStyle(PlainButtonStyle())
							}
						}
					} header: {
						AvailableAircraftSectionHeaderView(aircraftType: section.aircraftType ?? "NA")
					}
				}.listStyle(PlainListStyle())
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
				
			})
	}
}

//struct AvailableAircraftView_Previews: PreviewProvider {
//    static var previews: some View {
//			AvailableAircraftView(viewModel: .init(dataStore: DataStore.preview))
//				.preferredColorScheme(.dark)
//    }
//}
