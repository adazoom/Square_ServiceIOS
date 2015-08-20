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

class Employee: NSObject {
    
    var name: String
    var activity: String
    var numHours: Int
    var image: UIImage
    
    init(employeeDictionary: NSDictionary) {
        name = employeeDictionary["name"] as! String
        activity = employeeDictionary["activity"] as! String
        numHours = employeeDictionary["numberOfHours"] as! Int
        image = employeeDictionary["image"] as! UIImage
    }

}