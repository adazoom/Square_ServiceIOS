//
//  EventsManager.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/20/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import Foundation

private let eventsManagerInstance = EventsManager()

class EventsManager {
    class var sharedEventsManager: EventsManager {
        return eventsManagerInstance
    }
    
    var events = [Event]()

//    func tagSearch(tagName: String) -> NSArray {
//       var eventsWithTag = [Event]()
//       //for each each event, check categories, 
//        // for each category search for the desired tag 
//        //if tag is found, append to eventsWithTag
//        for var index=0;index<events.count; ++index{
//            //var eventTags = events[index].tags //list of strings which are names of tags
//            for var tagIndex=0;tagIndex<eventTags.count;++tagIndex{
//                if tagName == eventTags[tagIndex] {
//                    eventsWithTag.append(events[index])
//                }
//            
//            }
//        }
//        return eventsWithTag
//    }
}