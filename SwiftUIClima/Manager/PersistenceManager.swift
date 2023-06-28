//
//  PersistenceManager.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 27/06/23.
//

import Foundation
import CoreData

class PersistenceManager: ObservableObject {
    
    // A singleton for our entire app to use
    static let shared = PersistenceManager()
    
    let container: NSPersistentContainer
    
    private init() {
        
        container = NSPersistentContainer(name: "LocationsPersistence")
        
        // Merge object with same constraint values
        container.viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
        
        container.loadPersistentStores { description, error in
            
            // Print error - if any - when loading persistent stores
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
    
    func save() {
        
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("An error occured while saving context: \(error.localizedDescription)")
            }
        }
        
    }
    
}
