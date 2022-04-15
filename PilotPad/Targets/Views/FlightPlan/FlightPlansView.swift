//
//  FlightPlansView.swift
//  Views
//
//  Created by Richard Poutier on 4/10/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Models

public struct FlightPlansView: View {
	@ObservedObject public var model: FlightPlansModel
	
	public init(model: FlightPlansModel) {
		self.model = model
	}
	
	public var body: some View {
		SectionContainer(
			sectionTitle: "Flight Plans",
			contentView: {
				getContent()
			},
			titleAccessoryView: {
				EmptyView()
			}
		)
	}
	
	@ViewBuilder
	func getContent() -> some View {
		List {
			ForEach(model.items) {
				FlightPlanItemCellView(item: $0)
					.listRowInsets(EdgeInsets())
					.listRowSeparator(.hidden)
					.padding([.leading, .trailing, .bottom])
					.background(Color.clear)
			}
			.onDelete { _ in
					print("Delete called")
			}
			.background(Color.clear)
		}
		.background(Color.clear)
		.listStyle(PlainListStyle())
	}
}

struct FlightPlansView_Previews: PreviewProvider {
	static var previews: some View {
		FlightPlansView(model: .init())
	}
}
