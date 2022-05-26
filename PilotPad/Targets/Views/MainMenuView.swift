//
//  MainMenuView.swift
//  Views
//
//  Created by Richard Poutier on 4/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import SwiftUI
import Common
import ViewModels
import Models

public struct MainMenuView: View {
	private let navigationContext: NavigationContextController
	
	public init(navigationContext: NavigationContextController) {
		self.navigationContext = navigationContext
	}
    
	public var body: some View {
			VStack {
				FlightPlansView(model: .init())
				AvailableDatabasesView(viewModel: .init(navigationContext: self.navigationContext))
			}
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
			MainMenuView(navigationContext: .init())
    }
}
