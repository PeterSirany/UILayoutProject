//
//  MeasurementTypeSelectorView.swift
//  Views
//
//  Created by Richard Poutier on 7/5/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Common
import Models

struct MeasurementTypeSelectorView: View {
	@Binding var selectedMeasurement: MeasurementType
	var selectionOptions: [MeasurementType]
	
	private var selectedSegment: Binding<String> { Binding (
		get: { return self.selectedMeasurement.rawValue},
		set: { self.selectedMeasurement = MeasurementType(rawValue: $0)! }
		)
	}
	
	var body: some View {
		Picker("Units", selection: selectedSegment) {
			ForEach(selectionOptions.map { $0.rawValue }, id: \.self) { option in
				Text(option).tag(option)
			}
		}.pickerStyle(.segmented)
	}
}

struct MeasurementTypeSelectorView_Previews: PreviewProvider {
	static var previews: some View {
		MeasurementTypeSelectorView(selectedMeasurement: .constant(.meters), selectionOptions: [.meters, .knots]).pickerStyle(.segmented)
	}
}

