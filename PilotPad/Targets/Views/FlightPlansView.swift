//
//  FlightPlansView.swift
//  Views
//
//  Created by Richard Poutier on 4/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Models

struct FlightPlansView: View {
	@ObservedObject var model: FlightPlansModel
	
    var body: some View {
//        SectionContainer(
//					sectionTitle: "FLight Plans",
//					contentView: getContent(),
//					titleAccessoryView: { AddButtonView(action: { print("Add Flight Plan") }) }
//				)
			Text("")
    }
	
	@ViewBuilder
	func getContent() -> some View {
		List {
			ForEach(model.items) {
				FlightPlanItemCellView(item: $0)
			}
		}
	}
}

struct FlightPlansView_Previews: PreviewProvider {
    static var previews: some View {
			FlightPlansView(model: .init())
    }
}
