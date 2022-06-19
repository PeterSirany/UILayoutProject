//
//  ViewableProtocol.swift
//  Models
//
//  Created by Richard Poutier on 6/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public protocol Viewable: CustomStringConvertible, Identifiable, Hashable {
	
}

extension Viewable {
	public var id: UUID {
		return .init()
	}
	
	public var description: String {
		return String(describing: Self.self)
	}
}
