//
//  AircraftItemCellView.swift
//  Views
//
//  Created by Richard Poutier on 4/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Models

struct AircraftItemCellView: View {
	var aircraft: Aircraft
	
    var body: some View {
			HStack{
				Text(aircraft.registration ?? "No Reg.")
					.foregroundColor(Color.preliminaryTextColor)
				Text(aircraft.model ?? "No Model Found")
					.foregroundColor(Color.preliminaryTextColor)
					.padding(.leading, 20)
				Spacer()
				Text("NA")
					.foregroundColor(Color.preliminaryTextColor)
					.padding(.trailing, 25)
				Text("Go")
					.foregroundColor(Color.preliminaryTextColor)
			}
			.padding(.leading, 54)
			.padding(.trailing, 15)
			.padding(.vertical, 15)
			.addRoundedCornerStrokeBorder(strokeColor: .preliminaryTextColor, backgroundColor: .darkBackgroundColor)
//			.background(Color.darkBackgroundColor)
    }
}

struct AircraftItemCellView_Previews: PreviewProvider {
    static var previews: some View {
			AircraftItemCellView(aircraft: .init())
    }
}
