//
//  CreateNewRunwayIntersectionView.swift
//  Views
//
//  Created by Richard Poutier on 7/11/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI
import Models
import Common
import ViewModels

public class CreateNewRunwayIntersectionViewModel: ObservableObject {
	private let dataStore: DataStore
	private let navigationContext: NavigationContextController
	
	@Published public var name: String?
	@Published public var distanceFromStart: Double?
	@Published public var remaining: Double?
	
	public init(dataStore: DataStore, navigationContext: NavigationContextController) {
		self.dataStore = dataStore
		self.navigationContext = navigationContext
	}
	
	func create() {
		guard let name = self.name,
					let distanceFromStart = self.distanceFromStart,
					let remainingDistance = self.remaining else { return }
		let intersection = RunwayIntersection(
			name: name,
			distanceFromStart: distanceFromStart,
			remainingDistance: remainingDistance
		)
		do {
			try self.dataStore.save(intersection: intersection)
		} catch {
			print("Error saving intersection: \(error)")
		}
	}
	
	func back() {
		self.navigationContext.back()
	}
}

public struct CreateNewRunwayIntersectionView: View {
	@ObservedObject public var viewModel: CreateNewRunwayIntersectionViewModel
	
	public var body: some View {
		SectionContainer(sectionTitle: "New Runway Intersection") {
			HStack {
				
			}
		} titleAccessoryView: {
			HStack {
				Button(action: { self.viewModel.back() }, label: { Text("Back") })
				Button(action: { self.viewModel.create() }, label: { Text("Save") })
			}
		}
	}
}

