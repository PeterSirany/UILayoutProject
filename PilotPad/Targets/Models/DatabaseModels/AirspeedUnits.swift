//
//  AirspeedUnits.swift
//  Common
//
//  Created by Richard Poutier on 4/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public enum AirspeedUnits: Int, Identifiable, Hashable {
	case kts = 0
	case kph
	case mph
}
extension AirspeedUnits {
	public var id: Int {
		return self.rawValue
	}
}

