//
//  Person+CoreDataProperties.swift
//  wanderfinal
//
//  Created by Nimit on 2020-02-05.
//  Copyright © 2020 MacStudent. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    
    
    @NSManaged public var birthday: Date?
    @NSManaged public var country: String?
    @NSManaged public var gender: String?
    @NSManaged public var lad: Double
    @NSManaged public var lat: Double
    @NSManaged public var name: String?
    @NSManaged public var photo: Data?
    @NSManaged public var photoID: NSNumber?

}
