//
//  Location+CoreDataProperties.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 27/06/23.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var contry: String?

}

extension Location : Identifiable {

    var uId: UUID {
        id ?? UUID()
    }
    
    var uName: String {
        name ?? "Unknown Name"
    }
    
    var uCountry: String {
        contry ?? "Unknown Country"
    }
    
}
