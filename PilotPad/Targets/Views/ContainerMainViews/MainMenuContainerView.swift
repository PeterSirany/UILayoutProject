//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI
import Common
import ViewModels
import Models

public struct MainMenuContainerView: View {
	@ObservedObject var navigationContext: NavigationContextController
	private let viewFactory: ViewFactory
	
	public init(navigationContext: NavigationContextController, viewFactory: ViewFactory) {
		self.navigationContext = navigationContext
		self.viewFactory = viewFactory
	}
	
	public var body: some View {
		VStack(alignment: .leading) {
			self.getMainContent(view: $navigationContext.currentMainView)
		}
	}
	
	@ViewBuilder
	func getMainContent(view: Binding<ViewFactoryView>) -> some View {
		viewFactory.build(view.wrappedValue)
	}
}

//struct MainMenuContainerView_Previews: PreviewProvider {
//	static var previews: some View {
//		MainMenuContainerView()
//			.preferredColorScheme(.dark)
//			.previewInterfaceOrientation(.landscapeLeft)
//	}
//}
