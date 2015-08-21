//
//  EventsManager.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/20/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import Foundation
import UIKit

private let eventsManagerInstance = EventsManager()

class EventsManager {
    class var sharedEventsManager: EventsManager {
        return eventsManagerInstance
    }
    
    var events = [Event]()
    var myEvents = [Event]()
    
    init() {
        let  first = Event(title: "Curry Without Worry", location: "First Baptist Church, Octavia and Waller", timeframe: "16:00-17:00", eventDescription: "Curry Without Worry believes that hunger is not defined by an empty stomach, so they're open to whomever hungers. Dinner served at 5:30pm at UN Plaza", image: UIImage(named:"burger.jpg"))
        myEvents.append(first)
        
    }

}
