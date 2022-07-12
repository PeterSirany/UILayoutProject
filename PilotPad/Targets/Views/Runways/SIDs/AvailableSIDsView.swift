//
//  AvailableSIDsView.swift
//  Views
//
//  Created by Richard Poutier on 6/14/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import Models
import Common
import SwiftUI
import ViewModels

public class AvailableSIDsViewModel: ObservableObject {
	@Published public var sids: [AirportDepartureSid]
	public var databaseSids: [AirportDepartureSid]
	private let navigationContext: NavigationContextController
	
	public init(existingSids: [AirportDepartureSid], dataStore: DataStore, navigationContext: NavigationContextController) {
		self.sids = existingSids
		self.navigationContext = navigationContext
		self.databaseSids = (try? dataStore.fetchDepartureSids()) ?? []
	}
	
	public func createNew() {
		self.navigationContext.show(view: .newSID)
	}
	
	public func sidSelected(id: String) {
		guard let sid = self.databaseSids.first(where: { $0.id == id }) else { return }
		self.sids.append(sid)
	}
}

public struct AvailableSIDsView: View {
	@ObservedObject public var viewModel: AvailableSIDsViewModel
	public var body: some View {
		SectionContainer(sectionTitle: "Departure SIDS") {
			VStack(spacing: 10) {
				ForEach(self.viewModel.sids) { departureSid in
					SIDItemCellView(sid: departureSid)
				}
			}
		} titleAccessoryView: {
			HStack {
				Menu("Add") {
					VStack {
						ForEach(self.viewModel.databaseSids) { sid in
							Button(action: { self.viewModel.sidSelected(id: sid.id) }, label: { Text("\(sid.name)") })
						}
					}
				}
				Button(action: { self.viewModel.createNew() }, label: { Text("Create") })
			}
		}
	}
}
