//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI
import Common
import ViewModels

struct MainMenuContainerView: View {
	var body: some View {
		VStack(alignment: .leading) {
			
			HStack {
				Spacer()
				SectionContainer(
					sectionTitle: "New Aircraft General",
					contentView: {
//						CreateNewAircraftView(viewModel: CreateNewAircraftViewModel(aircraft: .init()))
//							.padding()
						EmptyView()
					},
					titleAccessoryView: { AddButtonView {
						print("foo")
					}.frame(width: 21, height: 21)}
				)
					.setWidth(800)
			}
		}
	}
}

struct MainMenuContainerView_Previews: PreviewProvider {
	static var previews: some View {
		MainMenuContainerView()
			.preferredColorScheme(.dark)
			.previewInterfaceOrientation(.landscapeLeft)
	}
}
