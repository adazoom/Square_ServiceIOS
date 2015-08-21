//
//  Event.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/20/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import Foundation
import UIKit

class Event: NSObject {
    
    var title: String
    var location: String
    var timeframe: String
    var eventDescription: String
    var imageURL: NSURL?
    
    init(eventDictionary: NSDictionary) {
        title = eventDictionary["organization"] as! String
        location = eventDictionary["place"] as! String
       
        //convert dates to string
        var st_time = eventDictionary["starttime"] as! String
        var end_time = eventDictionary["endtime"] as! String
        var timeToDisplay = st_time + "-" + end_time
        timeframe = timeToDisplay as String
        eventDescription = eventDictionary["description"] as! String
        
        if let imageURLString = eventDictionary["imageurl"] as? String {
            imageURL = NSURL(string: imageURLString)
        }
     
    }
    
}