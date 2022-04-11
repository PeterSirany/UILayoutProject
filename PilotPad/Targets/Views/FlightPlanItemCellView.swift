//
//  FlightPlanItemCellView.swift
//  Views
//
//  Created by Richard Poutier on 4/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Models

struct FlightPlanItemCellView: View {
	var item: FlightPlanItem
	
    var body: some View {
			HStack {
				HStack {
					TitleSubtitleView(
						titlePrefix: "FLT",
						highlightedTitle: item.flightNumber,
						subtitle: "OFP: 12"
					)
					Spacer()
						.setWidth(78)
					TitleSubtitleView(
						titlePrefix: nil,
						highlightedTitle: item.departureAirportCallsign,
						subtitle: item.departureDateString
					)
					
					Rectangle()
						.foregroundColor(.preliminaryTextColor)
						.frame(width: 8, height: 2)
						.padding(.horizontal, 20)
					
					TitleSubtitleView(
						titlePrefix: nil,
						highlightedTitle: item.arrivalAirportCallsign,
						subtitle: item.arrivalDateString
					)
				}
				Spacer()
				Text("Go")
					.foregroundColor(.preliminaryTextColor)
			}
			.padding(.vertical, 8)
			.padding(.horizontal, 20)
			.addRoundedCornerStrokeBorder(strokeColor: .preliminaryTextColor, backgroundColor: .darkBackgroundColor)
    }
}

struct FlightPlanItemCellView_Previews: PreviewProvider {
    static var previews: some View {
			FlightPlanItemCellView(item: .preview)
    }
}
