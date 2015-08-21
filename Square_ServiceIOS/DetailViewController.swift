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
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "eventCell")
        
        var refreshBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: "refreshTapped:")
        self.navigationItem.setRightBarButtonItems([refreshBarButtonItem], animated: true)
        
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
    
    func refreshButtonTap(sender:UIButton) {
        
        let url = NSURL(string: "https://api.myjson.com/bins/4760c")
        
        let dataTask = urlSession.dataTaskWithURL(url!, completionHandler: { data, response, error in
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            
            if let events = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? [AnyObject] {
                var parsedEvents = [Event]()
                for eventDictionary in events {
                    parsedEvents.append(Event(eventDictionary:
                        eventDictionary as! [NSObject: AnyObject]))
                }
                
                self.eventsManager.events = parsedEvents
                
                self.tableView.reloadData()
            }
        })
        
        dataTask.resume()
    }
    
    func downloadImageWithUrl(url: NSURL, forTableViewCell cell: EventCell) {
        if let cachedImage = imageCache[url] {
            cell.imageViewOutlet.image = cachedImage
        }
        else {
            cell.imageViewOutlet.image = nil
            let imageDownloadTask = urlSession.dataTaskWithURL(url,
                completionHandler: { [weak cell] data, response, error in
                    
                    if let image = UIImage(data: data) {
                        self.imageCache[url] = image
                        cell?.imageViewOutlet.image = image
                    }
                })
            
            imageDownloadTask.resume()
        }
    }

}

