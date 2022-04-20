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

@main
struct UILayoutProjectApp: App {
	@State var leftMenuNavigationViewModel: LeftMenuNavigationViewModel = LeftMenuNavigationViewModel()
	@State var listViewModel: ChecklistViewModel = ChecklistViewModel()
	
	@State var aircraft: Aircraft = .init()
	
	let persistenceController = PersistenceController.shared
	
	var body: some Scene {
		WindowGroup {
			CreateNewAircraftView(
				viewModel:
					CreateNewAircraftViewModel(
						aircraft: aircraft,
						dataStore: DataStoreImpl(managedObjectContext: persistenceController.container.viewContext)
					)
				)
				.padding()
				.environment(\.managedObjectContext, persistenceController.container.viewContext)
				.environmentObject(listViewModel)
				.environmentObject(leftMenuNavigationViewModel)
		}
	}
}
