//
//  WaypointItemCellView.swift
//  Views
//
//  Created by Richard Poutier on 7/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models
import Common

public struct WaypointItemCellView: View {
	public let waypoint: Waypoint
	
	public var body: some View {
		HStack(spacing: Constants.itemCellSpacing) {
			Text("Waypoint Name")
				.cellLabel()
			Text("Variation")
				.cellLabel()
			Text("Coordinate")
				.cellLabel()
			Spacer()
		}.borderedCell()
	}
}
