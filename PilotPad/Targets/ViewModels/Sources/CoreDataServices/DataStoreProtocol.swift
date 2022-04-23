//
//  DataStoreProtocol.swift
//  Models
//
//  Created by Richard Poutier on 4/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import Models

public protocol DataStore: AnyObject {
	func save(aircraft: Aircraft) throws
	func fetchAirplane() throws -> [Aircraft]
}
