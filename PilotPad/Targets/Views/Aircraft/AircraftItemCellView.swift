//
//  AircraftItemCellView.swift
//  Views
//
//  Created by Richard Poutier on 4/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct AircraftItemCellView: View {
    var body: some View {
			HStack{
				Text("Registration")
					.foregroundColor(Color.preliminaryTextColor)
				Text("Model")
					.foregroundColor(Color.preliminaryTextColor)
					.padding(.leading, 20)
				Spacer()
				Text("8")
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
        AircraftItemCellView()
    }
}
