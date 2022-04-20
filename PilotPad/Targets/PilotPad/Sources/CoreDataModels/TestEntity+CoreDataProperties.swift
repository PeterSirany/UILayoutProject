//
//  TestEntity+CoreDataProperties.swift
//  PilotPad
//
//  Created by Richard Poutier on 4/19/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//
//

import Foundation
import CoreData


extension TestEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TestEntity> {
        return NSFetchRequest<TestEntity>(entityName: "TestEntity")
    }

    @NSManaged public var weight: Double
    @NSManaged public var age: Int16
    @NSManaged public var name: String?

}

extension TestEntity : Identifiable {

}
