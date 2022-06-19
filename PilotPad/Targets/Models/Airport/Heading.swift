//
//  Heading.swift
//  Models
//
//  Created by Richard Poutier on 6/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public enum HeadingVariation: String, CustomStringConvertible, Hashable {
	case magneticVariation = "magneticVariation"
	case trueVariation
}
extension HeadingVariation {
	public var description: String {
		switch self {
		case .magneticVariation:
			return "M"
		case .trueVariation:
			return "T"
		}
	}
	public var intValue: Int {
		switch self {
		case .magneticVariation:
			return 0
		case .trueVariation:
			return 1
		}
	}
}

public class Heading: Viewable {
	public let value: String
	public let variation: HeadingVariation?
	public var description: String {
		"\(value)\(variation == nil ? "" : variation!.description)"
	}
	
	public init(value: String, variation: HeadingVariation?) {
		self.value = value
		self.variation = variation
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(value)
		hasher.combine(variation)
	}
	
	public static func == (lhs: Heading, rhs: Heading) -> Bool {
		return lhs.variation == rhs.variation && lhs.value == rhs.value
	}
}
