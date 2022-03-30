//
//  View+ext.swift
//  Common
//
//  Created by Richard Poutier on 3/29/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public extension View {
	
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape(RoundedCorner(radius: radius, corners: corners))
	}
	
	func gradientForeground(colors: [Color]) -> some View {
		self.overlay(LinearGradient(gradient: .init(colors: colors),
																startPoint: .topLeading,
																endPoint: .bottomTrailing))
			.mask(self)
	}
}