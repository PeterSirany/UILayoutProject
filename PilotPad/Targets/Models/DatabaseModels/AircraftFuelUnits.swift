//
//  AircraftFuelUnits.swift
//  Common
//
//  Created by Richard Poutier on 4/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public enum AircraftFuelUnits: Int, Identifiable {
	case lbs = 0
	case kbs
	case gal
	case ltr
}
extension AircraftFuelUnits {
	public var id: Int {
		return self.rawValue
	}
}

