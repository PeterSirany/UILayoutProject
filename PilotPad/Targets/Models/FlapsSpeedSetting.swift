//
//  FlapsSpeedSetting.swift
//  Models
//
//  Created by Richard Poutier on 4/18/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public class FlapsSpeedSetting: ObservableObject, Identifiable {
	public var id: UUID = .init()
	@Published public var position: Double?
	@Published public var speed: Double?
}
