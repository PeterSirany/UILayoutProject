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
		HStack {
			Text("Name")
				.cellLabel()
			Text("Course")
				.cellLabel()
			Text("Initial Altitude")
				.cellLabel()
		}.borderedCell()
	}
}

