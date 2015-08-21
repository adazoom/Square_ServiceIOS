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
        location = eventDictionary["location"] as! String
       
        //convert dates to string
        var st_time = eventDictionary["starttime"] as! NSDate
        var end_time = eventDictionary["endtime"] as! NSDate
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm" //format style
        var startString = dateFormatter.stringFromDate(st_time)
        var endString = dateFormatter.stringFromDate(end_time)
        var timeToDisplay = startString + "-" + endString
       
        timeframe = timeToDisplay as String
        eventDescription = eventDictionary["description"] as! String
        
        if let imageURLString = eventDictionary["imageurl"] as? String {
            imageURL = NSURL(string: imageURLString)
        }
     
    }
    
}