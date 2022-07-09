//
//  STARItemCellView.swift
//  Views
//
//  Created by Richard Poutier on 7/8/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import Models
import SwiftUI
import Common

public struct STARItemCellView: View {
	let star: AirportArrivalStar
	
	public var body: some View {
		HStack(spacing: Constants.itemCellSpacing) {
			Text("Name")
				.cellLabel()
			Text("Course")
				.cellLabel()
			Text("Initial Altitude")
				.cellLabel()
			Spacer()
		}.borderedCell()
	}
}
