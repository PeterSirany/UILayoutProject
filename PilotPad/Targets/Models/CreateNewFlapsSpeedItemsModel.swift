//
//  CreateNewFlapsSpeedItemsModel.swift
//  Views
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import SwiftUI

public class CreateNewFlapsSpeedItemsModel: ObservableObject {
	
	@Published public var items: [FlapsSpeedSetting]
	
	public init(items: [FlapsSpeedSetting]) {
		self.items = []
	}
	
	public func addItem() {
		self.items.append(.init())
	}
}

public class FlapsSpeedItem: Identifiable {
	public init(position: Int?, speed: Int?) {
		self.position = position
		self.speed = speed
	}
	
	public let id: UUID = .init()
	public var position: Int?
	public var speed: Int?
}
