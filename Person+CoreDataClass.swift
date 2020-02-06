//
//  Person+CoreDataClass.swift
//  wanderfinal
//
//  Created by Nimit on 2020-02-05.
//  Copyright © 2020 MacStudent. All rights reserved.
//
//

import Foundation
import CoreData
import MapKit

@objc(Person)
public class Person: NSManagedObject , MKAnnotation{
    
    
    
    public var coordinate: CLLocationCoordinate2D {
     return CLLocationCoordinate2DMake(lat, lad)
  
    }
    
    var hasPhoto: Bool {
     
        return photoID != nil
    
    }
    
    var photoURL: URL {
      assert(photoID != nil, "No photo ID set")
      let filename = "Photo-\(photoID!.intValue).jpg"
      return applicationDocumentsDirectory.appendingPathComponent(filename)
    }

    
    
    var photoImage: UIImage? {
        
    return UIImage(contentsOfFile: photoURL.path)
        
        
    }
    
    class func nextPhotoID() -> Int {
    let userDefaults = UserDefaults.standard
        let currentID = userDefaults.integer(forKey: "PhotoID") + 1; userDefaults.set(currentID, forKey: "PhotoID"); userDefaults.synchronize()
 
        return currentID
 
    }
    
    
    
}
