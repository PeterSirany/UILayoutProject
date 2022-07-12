//
//  ApproachItemCellView.swift
//  Views
//
//  Created by Richard Poutier on 7/11/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models
import Common
import ViewModels

public struct ApproachItemCellView: View {
	
	
	public var body: some View {
		HStack(spacing: Constants.itemCellSpacing) {
			Text("Name")
				.cellLabel()
			Text("Final Crs")
				.cellLabel()
			Spacer()
			// MARK: - TODO
			// unsure if the following value is what's to be used
			Text("FAF Altitude")
				.cellLabel()
			Spacer()
		}.borderedCell()
	}
}

