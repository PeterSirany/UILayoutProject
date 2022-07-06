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
	@ViewBuilder func setHidden(_ isHidden: Bool) -> some View {
		if !isHidden {
			self
		}
	}
	
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape(RoundedCorner(radius: radius, corners: corners))
	}
	
	func gradientForeground(colors: [Color]) -> some View {
		self.overlay(LinearGradient(gradient: .init(colors: colors),
																startPoint: .topLeading,
																endPoint: .bottomTrailing))
			.mask(self)
	}
	
	func setWidth(_ width: CGFloat) -> some View {
		self
			.frame(width: width)
	}
	
	func addRoundedCornerStrokeBorder(color: Color) -> some View {
		self
			.background(
				RoundedRectangle(cornerRadius: 8)
					.stroke(color, lineWidth: 1)
			)
	}
	func addRoundedCornerStrokeBorder(strokeColor: Color, backgroundColor: Color) -> some View {
		self
			.background(
				RoundedRectangle(cornerRadius: 8)
					.stroke(strokeColor, lineWidth: 2)
					.background(backgroundColor)
			)
			.cornerRadius(8)
	}
	
}
