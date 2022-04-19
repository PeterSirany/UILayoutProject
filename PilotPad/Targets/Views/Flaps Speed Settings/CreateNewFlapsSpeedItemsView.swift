//
//  CreateNewFlapsSpeedItemsView.swift
//  Views
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Models

struct CreateNewFlapsSpeedItemsView: View {
	@ObservedObject var model: CreateNewFlapsSpeedItemsModel
	
	var body: some View {
		SectionContainer(
			sectionTitle: "Flaps Speed",
			contentView: {
				self.getContent()
			},
			titleAccessoryView: {
				self.getAccessoryView()
			}
		)
	}
	
	@ViewBuilder
	func getContent() -> some View {
		ScrollView(showsIndicators: false) {
			ForEach($model.items) { item in
				NewFlapsSpeedItemCellView(flapsSpeedSetting: item)
			}
		}.padding(.vertical, 4)
	}
	
	@ViewBuilder
	func getAccessoryView() -> some View {
		AddButtonView {
			model.addItem()
		}
		.frame(
			width: 17,
			height: 17
		)
	}
	
}

struct CreateNewFlapsSpeedItemsView_Previews: PreviewProvider {
	static var previews: some View {
		CreateNewFlapsSpeedItemsView(model: .init(items: []))
			.frame(width: 250, height: 308)
			.previewInterfaceOrientation(.landscapeLeft)
			.preferredColorScheme(.dark)
	}
}
