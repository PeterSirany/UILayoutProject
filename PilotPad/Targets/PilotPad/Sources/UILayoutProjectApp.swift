//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import SwiftUI
import Views
import ViewModels
import Models

let persistenceController = PersistenceController.shared
let dataStore = DataStoreImpl(managedObjectContext: persistenceController.container.viewContext)
let viewFactory = ViewFactory(dataStore: dataStore)
let navigationContext = PilotPadNavigationContextController(viewFactory: viewFactory)


@main
struct UILayoutProjectApp: App {
	@State var leftMenuNavigationViewModel: LeftMenuNavigationViewModel = LeftMenuNavigationViewModel()
	@State var listViewModel: ChecklistViewModel = ChecklistViewModel()
	
	@State var aircraft: Aircraft = .init()
	
	
	var body: some Scene {
		WindowGroup {
//			CreateNewAircraftView(
//				viewModel:
//					CreateNewAircraftViewModel(
//						aircraft: aircraft,
//						dataStore: DataStoreImpl(managedObjectContext: persistenceController.container.viewContext)
//					)
//				)
			MainMenuContainerView(navigationContext: navigationContext)
			
//			AvailableAircraftView(viewModel: .init(dataStore: DataStoreImpl(managedObjectContext: persistenceController.container.viewContext)))
				.padding()
				.environment(\.managedObjectContext, persistenceController.container.viewContext)
				.environmentObject(listViewModel)
				.environmentObject(leftMenuNavigationViewModel)
		}
	}
}
