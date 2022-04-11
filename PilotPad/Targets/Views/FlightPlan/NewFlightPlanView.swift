//
//  NewFlightPlanView.swift
//  Views
//
//  Created by Richard Poutier on 4/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI


/// Container View for building a flgiht Plan
struct NewFlightPlanView: View {
    var body: some View {
			VStack {
				AircraftSelectionView(model: .init())
				EnterFlightPlanDetailsView()
			}
    }
}

struct NewFlightPlanView_Previews: PreviewProvider {
    static var previews: some View {
			NewFlightPlanView()
				.preferredColorScheme(.dark)
    }
}
