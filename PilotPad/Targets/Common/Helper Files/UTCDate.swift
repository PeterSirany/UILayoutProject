//
//  UILayoutProjectApp.swift
//  UILayoutProject
//
//  Created by Peter Sirany on 3/16/22.
//

import Foundation
import SwiftUI

public class UTCDate: ObservableObject {
	public init() { }
	public let dateTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
}


