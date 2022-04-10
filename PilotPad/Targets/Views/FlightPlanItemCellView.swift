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
						titlePrefix: nil,
						highlightedTitle: "1692",
						subtitle: "OFP: 12"
					)
					Spacer()
						.setWidth(78)
					TitleSubtitleView(
						titlePrefix: nil,
						highlightedTitle: "MSP",
						subtitle: "Departure"
					)
					
					Rectangle()
						.foregroundColor(.preliminaryTextColor)
						.frame(width: 8, height: 2)
						.padding(.horizontal, 20)
					
					TitleSubtitleView(
						titlePrefix: nil,
						highlightedTitle: "LAX",
						subtitle: "Arrival"
					)
				}
				Spacer()
				Text("Go")
					.foregroundColor(.preliminaryTextColor)
			}
			.padding(.vertical, 8)
			.padding(.horizontal, 20)
			.background(Color.darkBackgroundColor)
			.addRoundedCornerStrokeBorder(color: .preliminaryTextColor)
    }
}

struct FlightPlanItemCellView_Previews: PreviewProvider {
    static var previews: some View {
			FlightPlanItemCellView(item: .preview)
    }
}
