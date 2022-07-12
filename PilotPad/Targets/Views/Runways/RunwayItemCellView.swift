//
//  RunwayItemCellView.swift
//  Views
//
//  Created by Richard Poutier on 7/5/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models
import ViewModels

public struct RunwayItemCellView: View {
	let runway: AirportRunway
	public var body: some View {
		HStack(spacing: 47) {
			Text(runway.name.capitalized)
				.cellLabel()
			Text(runway.heading.value.capitalized)
				.cellLabel()
			Spacer()
			Text(Formatter.lengthFormatter.string(from: NSNumber(value: runway.length)) ?? "")
				.cellLabel()
		}
	}
}

struct RunwayItemCellView_Previews: PreviewProvider {
	static var previews: some View {
		RunwayItemCellView(runway: .init(name: "12L", length: 4500, touchDownZoneElevation: 124.3, heading: Heading.init(value: "12.0", variation: .magneticVariation), displacedThreshold: .init(value: 112, measurementType: .knots), departureSids: [], arrivalStars: [], intersections: []))
			.borderedCell()
	}
}
