//
//  DefaultCellLabelViewModifier.swift
//  Views
//
//  Created by Richard Poutier on 7/5/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public struct DefaultCellLabel: ViewModifier {
	public func body(content: Content) -> some View {
		content
			.font(.system(size: 16))
			.foregroundColor(.cellLabelColor)
	}
}
