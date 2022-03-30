//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation
import SwiftUI

public struct RoundedCorner: Shape {
	public var radius: CGFloat = .infinity
	public var corners: UIRectCorner = .allCorners
	
	public func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}

public struct ColorGradient {
	
	public static var appTitleBarColors = Gradient(colors: [Color.black])
	
	public static var darkGradientColors = Gradient(colors: [Color.darkBackgroundColor, Color.containerColor])
	
	public static var blackGradientColors = Gradient(colors: [Color.blackBackgroundColor, Color.containerColor])
	
}
