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
    var image: UIImage
    var tag: [String]
    
    init(eventDictionary: NSDictionary) {
        title = eventDictionary["organization"] as! String
        location = eventDictionary["place"] as! String
        var tagString = eventDictionary["tag"] as! String
        tag = tagString.componentsSeparatedByString(",")
        //convert dates to string
        var st_time = eventDictionary["starttime"] as! String
        var end_time = eventDictionary["endtime"] as! String
         //"llo, playgroun"

        var timeToDisplay = st_time.substringWithRange(Range<String.Index>(start: advance(st_time.startIndex, 11), end: advance(st_time.endIndex, -4))) + "-" + end_time.substringWithRange(Range<String.Index>(start: advance(end_time.startIndex, 11), end: advance(end_time.endIndex, -4)))
        timeframe = timeToDisplay as String
        eventDescription = eventDictionary["description"] as! String
        
        
        if let imageURLString = eventDictionary["pic"] as? String {
            imageURL = NSURL(string: imageURLString)
        }
        
        image = UIImage(named:"burger.jpg")!
     
    }
    
    init(title: String, location: String, timeframe: String, eventDescription: String, image: UIImage? = nil) {
        self.title = title
        self.location = location
        self.timeframe = timeframe
        self.eventDescription = eventDescription
        self.image = image!
        self.tag = ["food"]
    }
    
}