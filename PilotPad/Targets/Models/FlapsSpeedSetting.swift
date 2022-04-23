//
//  FlapsSpeedSetting.swift
//  Models
//
//  Created by Richard Poutier on 4/18/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public class FlapsSpeedSetting: ObservableObject, Identifiable, Hashable {
	public var id: UUID = .init()
	@Published public var position: Double?
	@Published public var speed: Double?
	
	public static func == (lhs: FlapsSpeedSetting, rhs: FlapsSpeedSetting) -> Bool {
		return lhs.id == rhs.id && lhs.position == rhs.position && lhs.speed == rhs.speed
	}
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(position)
		hasher.combine(speed)
	}
}
