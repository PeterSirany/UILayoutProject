//
//  AvailableAircraftSectionHeaderView.swift
//  Views
//
//  Created by Richard Poutier on 4/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Common

struct AvailableAircraftSectionHeaderView: View {
    var body: some View {
			HStack {
				Text("Type: B737")
					.foregroundColor(.white)
					.padding(.leading, 25)
				Spacer()
				Text("No. Flights")
					.foregroundColor(.white)
					.padding(.trailing, 50)
			}
    }
}

struct AvailableAircraftSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableAircraftSectionHeaderView()
    }
}
