//
//  PersistenceController.swift
//  PilotPad
//
//  Created by Richard Poutier on 4/7/22.
//  Copyright © 2022 Peter.Sirany. All rights reserved.
//

import Foundation
import CoreData

public struct PersistenceController {
	// A singleton for our entire app to use
	public static let shared = PersistenceController()
	
	// Storage for Core Data
	public let container: NSPersistentContainer
	
	// A test configuration for SwiftUI previews
	static var preview: PersistenceController = {
		let controller = PersistenceController(inMemory: true)
		
		// Create 10 example programming languages.
		
		return controller
	}()
	
	// An initializer to load Core Data, optionally able
	// to use an in-memory store.
	public init(inMemory: Bool = false) {
		// If you didn't name your model Main you'll need
		// to change this name below.
		container = NSPersistentContainer(name: "Model")
		
		if inMemory {
			container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
		}
		
		container.loadPersistentStores { description, error in
			if let error = error {
				fatalError("Error: \(error.localizedDescription)")
			} else {
				print("Description: \(description.description)")
			}
		}
	}
	
	public func save() throws {
		let context = container.viewContext
		
		if context.hasChanges {
			do {
				try context.save()
			}
		}
	}
}
