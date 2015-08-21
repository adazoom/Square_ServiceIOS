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
}