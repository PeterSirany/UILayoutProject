//
//  SID.swift
//  Views
//
//  Created by Richard Poutier on 6/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import Models
import SwiftUI
import Common

public struct SIDItemCellView: View {
	let sid: AirportDepartureSid
	
	public var body: some View {
		HStack(spacing: Constants.itemCellSpacing) {
			Text(sid.name.uppercased())
				.cellLabel()
			Text(sid.initialRunwayHeading.value + "º")
				.cellLabel()
			Spacer()
			// MARK: - TODO
			// unsure if the following value is what's to be used
			Text("\(Formatter.lengthFormatter.string(from: NSNumber(value: sid.waypoints.first?.altitude ?? 0)) ?? "N/A")")
				.cellLabel()
			Spacer()
		}.borderedCell()
	}
}
