//
//  Employee.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/19/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class Employee: NSObject, NSCoding {
    
    var name: String
    var activity: String
    var numHours: Int
    var image: UIImage
    
    init(name: String, activity: String, numHours: Int, image: UIImage? = nil) {
        self.name = name
        self.activity = activity
        self.numHours = numHours
        self.image = image!
    }
    
    init(employeeDictionary: NSDictionary) {
        name = employeeDictionary["name"] as! String
        activity = employeeDictionary["activity"] as! String
        numHours = employeeDictionary["numberOfHours"] as! Int
        image = employeeDictionary["image"] as! UIImage
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        activity = aDecoder.decodeObjectForKey("activity") as! String
        numHours = aDecoder.decodeIntegerForKey("numberOfHours")
        image = aDecoder.decodeObjectForKey("image") as! UIImage
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(activity,forKey: "activity")
        aCoder.encodeInteger(numHours,forKey: "numberOfHours")
        aCoder.encodeObject(image, forKey: "UIImage")

    }

}