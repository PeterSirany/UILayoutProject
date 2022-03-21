//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation

import SwiftUI

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ColorGradient {
    
    static var appTitleBarColors = Gradient(colors: [Color.black])
    
    static var darkGradientColors = Gradient(colors: [Color.darkBackgroundColor, Color.containerColor])
    
    static var blackGradientColors = Gradient(colors: [Color.blackBackgroundColor, Color.containerColor])
    
//       static var gradientColors = Gradient(colors: [Color("DarkRedColor"), Color.orange, Color.yellow, Color.green, Color.blue, Color.purple])

//       static var gradientColors = Gradient(colors: [Color("AlysiasRoomPurple"), Color("AlysiasRoomTeal")])
}

extension View {
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

extension Color {

    static let preliminaryTextColor = Color("PreliminaryTextColor")
    static let actualTextColor = Color("ActualTextColor")
    static let calculatedTextColor = Color("CalculatedTextColor")
    static let timeColor = Color("TimeTextColor")
    static let warningAlertColor = Color("WarningTextColor")
    
    static let logoColor = Color("TitleLogoColor")
    static let blackBackgroundColor = Color("BlackBackgroundColor")
    static let darkBackgroundColor = Color("DarkBackgroundGradientColor")
    static let containerColor = Color("Container_Background_Main")
    static let shadowColor = Color("ShadowColor")
    
    static let blueBorderColor = Color("BlueBorderColor")
}
