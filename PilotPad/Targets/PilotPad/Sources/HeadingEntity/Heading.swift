//
//  Heading.swift
//  PilotPad
//
//  Created by Richard Poutier on 6/18/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation

public enum HeadingVariation: String {
	case magneticVariation
	case trueVariation
}

public class Heading {
	public init(value: Double, variation: HeadingVariation?) {
		self.value = value
		self.variation = variation
	}
	
	public let value: Double
	public let variation: HeadingVariation?
}
