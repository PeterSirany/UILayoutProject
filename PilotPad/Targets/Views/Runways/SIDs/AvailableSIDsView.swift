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
	private let navigationContext: NavigationContextController
	
	public init(existingSids: [AirportDepartureSid], navigationContext: NavigationContextController) {
		self.sids = existingSids
		self.navigationContext = navigationContext
	}
	
	public func createNew() {
		self.navigationContext.show(view: .newSID)
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
			Button(action: { self.viewModel.createNew() }, label: { Text("Create") })
		}
	}
}
