//
//  EnterFlightPlanDetailsView.swift
//  Views
//
//  Created by Richard Poutier on 4/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct EnterFlightPlanDetailsView: View {
	
	var body: some View {
		SectionContainer(
			sectionTitle: "Flight Plan Details",
			contentView: {
				getContent()
					.padding(.horizontal)
			},
			titleAccessoryView: { EmptyView() }
		)
	}
	
	@ViewBuilder
	func getContent() -> some View {
		VStack {
			HStack {
			SimpleTextField(
				title: "Trip Fuel",
				placeholder: "Tap To Search",
				onCommitText: { _ in }
			)
			SimpleTextField(
				title: "Alternate Fuel",
				placeholder: "Kgs",
				onCommitText: { _ in }
			)
			SimpleTextField(
				title: "Reserve Fuel",
				placeholder: "Kgs",
				onCommitText: { _ in }
			)
			SimpleTextField(
				title: "Contingency Fuel",
				placeholder: "Kgs",
				onCommitText: { _ in }
			)
		}
			HStack {
				SimpleTextField(
					title: "Trip Time",
					placeholder: "hh:mm",
					onCommitText: { _ in }
				)
				SimpleTextField(
					title: "Alternate Time",
					placeholder: "hh:mm",
					onCommitText: { _ in }
				)
				SimpleTextField(
					title: "Reserve Time",
					placeholder: "hh:mm",
					onCommitText: { _ in }
				)
				SimpleTextField(
					title: "Contingency Time",
					placeholder: "hh:mm",
					onCommitText: { _ in }
				)
			}
			HStack {
				SimpleTextField(
					title: "ZFW PS",
					placeholder: "Tap To Search",
					onCommitText: { _ in }
				)
				SimpleTextField(
					title: "ZFW MS",
					placeholder: "Kgs",
					onCommitText: { _ in }
				)
				SimpleTextField(
					title: "Takeoff Weight",
					placeholder: "Kgs",
					onCommitText: { _ in }
				)
				SimpleTextField(
					title: "Landing Weight",
					placeholder: "Kgs",
					onCommitText: { _ in }
				)
			}
		}
	}
}

struct EnterFlightPlanDetailsView_Previews: PreviewProvider {
    static var previews: some View {
			EnterFlightPlanDetailsView()
				.preferredColorScheme(.dark)
    }
}
