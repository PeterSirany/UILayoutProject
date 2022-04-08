//
//  AirplaneEntity.swift
//  PilotPad
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import CoreData

public class AirplaneEntity: NSManagedObject {
	
}

extension AirplaneEntity {
	@nonobjc public class func fetchRequest() -> NSFetchRequest<AirplaneEntity> {
			return NSFetchRequest<AirplaneEntity>(entityName: "AirplaneEntity")
	}
	
	@NSManaged public var registration: String?
	@NSManaged public var type: String?
	@NSManaged public var model: String?
}
