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
			EmptyView()
		}
	}
}

struct EnterFlightPlanDetailsView_Previews: PreviewProvider {
    static var previews: some View {
			EnterFlightPlanDetailsView()
				.preferredColorScheme(.dark)
    }
}
