//
//  ViewFactoryView.swift
//  ViewModels
//
//  Created by Richard Poutier on 4/23/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public enum ViewFactoryView: Identifiable, Hashable {
	case availableAircraftList
	case availableAirportsList
	case newAircraft(aircraft: Aircraft)
	case existingAircraft(aircraft: Aircraft)
	case mainMenu
	
	public var id: UUID {
		return UUID()
	}
}

//extension ViewFactoryView: Hashable {
//	public func hash(into hasher: inout Hasher) {
//		switch self {
//		case .availableAircraftList:
//			break
//		case .newAircraft(let aircraft):
//			hasher.combine(aircraft)
//		}
//	}
//}
