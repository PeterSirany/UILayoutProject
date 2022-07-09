//
//  AvailableDatabasesView.swift
//  Views
//
//  Created by Richard Poutier on 4/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import ViewModels

struct AvailableDatabasesView: View {
	@ObservedObject var viewModel: AvailableDatabasesViewModel
	
	public init(viewModel: AvailableDatabasesViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
        SectionContainer(
					sectionTitle: "DATABASES",
					contentView: {
						VStack {
							HStack {
								
								self.buildButton(ofType: .airports)
								
								self.buildButton(ofType: .aircraft)
								self.buildButton(ofType: .waypoints)
								Spacer()
							}.padding(.horizontal)
							HStack {
								Spacer()
								self.buildButton(ofType: .passengers)
								Spacer()
								self.buildButton(ofType: .notes)
								Spacer()
							}.padding(.horizontal)
						}
					},
					titleAccessoryView: { EmptyView() })
    }
	
	@ViewBuilder
	func buildButton(ofType type: AvailableDatabasesViewModel.DatabaseType) -> some View {
		Button(action: {
			self.viewModel.databaseSelected(type)
		}) {
			DatabaseItemView(title: type.rawValue.capitalized)
		}
	}
}

struct AvailableDatabasesView_Previews: PreviewProvider {
    static var previews: some View {
			AvailableDatabasesView(viewModel: .init(navigationContext: .init()))
				.preferredColorScheme(.dark)
    }
}
