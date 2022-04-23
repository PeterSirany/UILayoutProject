//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI
import Common
import ViewModels

public struct MainMenuContainerView: View {
	@ObservedObject var navigationContext: PilotPadNavigationContextController
	
	public init(navigationContext: PilotPadNavigationContextController) {
		self.navigationContext = navigationContext
	}
	
	public var body: some View {
		VStack(alignment: .leading) {
			self.getMainContent(view: $navigationContext.currentMainView)
		}
	}
	
	@ViewBuilder
	func getMainContent(view: Binding<ViewFactoryView>) -> some View {
		navigationContext.get(view: view.wrappedValue)
	}
}

//struct MainMenuContainerView_Previews: PreviewProvider {
//	static var previews: some View {
//		MainMenuContainerView()
//			.preferredColorScheme(.dark)
//			.previewInterfaceOrientation(.landscapeLeft)
//	}
//}
