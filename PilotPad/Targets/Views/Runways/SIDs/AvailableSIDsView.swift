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

public class AvailableSIDsViewModel: ObservableObject {
	public func createNew() {
		
	}
}

public struct AvailableSIDsView: View {
	public let viewModel: AvailableSIDsViewModel
	public var body: some View {
		SectionContainer(sectionTitle: "Departure SIDS") {
			Text("foo")
		} titleAccessoryView: {
			Button(action: { self.viewModel.createNew()() }, label: { Text("Create") })
		}

	}
}
