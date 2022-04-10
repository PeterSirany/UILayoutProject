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
	
	@Published public var items: [FlapsSpeedItem]
	
	public init() {
		self.items = [.init(position: nil, speed: nil)]
	}
	
	public func addItem() {
		self.items.append(.init(position: nil, speed: nil))
	}
	
	public func submitPositionValue(position: String, for id: UUID) {
		if let item = items.first(where: { $0.id == id }) {
			item.position = Int(position) ?? 0
		}
	}
	
	public func submitSpeedValue(speed: String, for id: UUID) {
		if let item = items.first(where: { $0.id == id }) {
			item.speed = Int(speed) ?? 0
		}
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
