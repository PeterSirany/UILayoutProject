//
//  RunwayIntersectionCellItemView.swift
//  Views
//
//  Created by Richard Poutier on 7/11/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models
import Common

public struct RunwayIntersectionCellItemView: View {
	let intersection: RunwayIntersection
	
	public var body: some View {
		HStack(spacing: Constants.itemCellSpacing) {
			Text(intersection.name.uppercased())
				.cellLabel()
			Text(Formatter.lengthFormatter.string(from: intersection.distanceFromStart) ?? "N/A")
				.cellLabel()
			Text(Formatter.lengthFormatter.string(from: intersection.remainingDistance) ?? "N/A")
				.cellLabel()
			Spacer()
		}.borderedCell()
	}
}
