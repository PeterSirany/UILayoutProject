//
//  AvailableAircraftView.swift
//  Views
//
//  Created by Richard Poutier on 4/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct AvailableAircraftView: View {
    var body: some View {
			SectionContainer(
				sectionTitle: "Aircraft",
				contentView: {
					List {
						Section {
							VStack {
								AircraftItemCellView()
									.listRowInsets(EdgeInsets())
									.listRowSeparator(.hidden)
								AircraftItemCellView()
									.listRowInsets(EdgeInsets())
									.listRowSeparator(.hidden)
								AircraftItemCellView()
									.listRowInsets(EdgeInsets())
									.listRowSeparator(.hidden)
								AircraftItemCellView()
									.listRowInsets(EdgeInsets())
									.listRowSeparator(.hidden)
//									.padding([.leading, .trailing, .bottom])
									.background(Color.clear)
							}
						} header: {
							AvailableAircraftSectionHeaderView()
						}
					}.listStyle(PlainListStyle())
				},
				titleAccessoryView: { EmptyView() })
    }
}

struct AvailableAircraftView_Previews: PreviewProvider {
    static var previews: some View {
			AvailableAircraftView()
				.preferredColorScheme(.dark)
    }
}
