//
//  AircraftSelectionView.swift
//  Views
//
//  Created by Richard Poutier on 4/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

class NewFlightPlanModel: ObservableObject {
	@Published var aircraftName: String = ""
	@Published var passengersCount: String = ""
	@Published var luggageWeight: String = ""
	@Published var zeroFuelWeight: String = ""
	
//	public func commitText(_ text: String, tag: TextFieldTag)
}

struct AircraftSelectionView: View {
	@ObservedObject var model: NewFlightPlanModel
	
	enum TextFieldTag {
		case aircraft
		case passengers
		case luggage
		case zeroFuelWeight
	}
	
    var body: some View {
			SectionContainer(
				sectionTitle: "Aircraft",
				contentView: {
					getContent()
						.padding(.horizontal)
				},
				titleAccessoryView: { EmptyView() }
			)
    }
	
	@ViewBuilder
	func getContent() -> some View {
		HStack {
			SimpleTextField(
				title: "Aircraft",
				placeholder: "Tap To Search",
				onCommitText: { _ in }
			)
			SimpleTextField(
				title: "Passengers",
				placeholder: "Kgs",
				onCommitText: { _ in }
			)
			SimpleTextField(
				title: "Luggage/Cargo",
				placeholder: "Kgs",
				onCommitText: { _ in }
			)
			SimpleTextField(
				title: "ZFW",
				placeholder: "Kgs",
				onCommitText: { _ in }
			)
		}
	}
}

struct AircraftSelectionView_Previews: PreviewProvider {
    static var previews: some View {
			AircraftSelectionView(model: .init())
				.preferredColorScheme(.dark)
    }
}
