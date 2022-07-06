//
//  View+ViewModifier+ext.swift
//  Views
//
//  Created by Richard Poutier on 7/5/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public extension View {
	func borderedCell() -> some View {
		modifier(BorderedCell())
	}
	func cellLabel() -> some View {
		modifier(DefaultCellLabel())
	}
}
