//
//  DetailViewController.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/18/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var categoriesSelectorOutlet: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var urlSession: NSURLSession!
    let eventsManager = EventsManager.sharedEventsManager
    
    var imageCache = [NSURL: UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    func configureView() {
       self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "eventCell")
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        urlSession = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsManager.events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! EventCell
        
        let event = eventsManager.events[indexPath.row]
        
        cell.titleOutlet.text = event.title
        cell.descriptionOutlet.text = event.eventDescription
        cell.locationOutlet.text = event.location
        cell.timeframeOutlet.text = event.timeframe
        
        if let imageURL = event.imageURL {
            downloadImageWithUrl(imageURL, forTableViewCell: cell)
        }
        
        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}

