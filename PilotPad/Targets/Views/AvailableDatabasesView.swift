//
//  AvailableDatabasesView.swift
//  Views
//
//  Created by Richard Poutier on 4/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI

struct AvailableDatabasesView: View {
    var body: some View {
        SectionContainer(
					sectionTitle: "DATABASES",
					contentView: {
						VStack {
							HStack {
								DatabaseItemView(title: "Airports")
								DatabaseItemView(title: "Aircraft")
								DatabaseItemView(title: "Waypoints")
							}
							HStack {
								DatabaseItemView(title: "Passengers")
								DatabaseItemView(title: "Notes")
							}
						}
					},
					titleAccessoryView: { EmptyView() })
    }
}

struct AvailableDatabasesView_Previews: PreviewProvider {
    static var previews: some View {
			AvailableDatabasesView()
				.preferredColorScheme(.dark)
    }
}
