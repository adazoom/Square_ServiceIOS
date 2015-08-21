//
//  DetailViewController.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/18/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var urlSession: NSURLSession!
    let eventsManager = EventsManager.sharedEventsManager
    var eventsToShow = [Event]()
    
    var imageCache = [NSURL: UIImage]()

    @IBOutlet weak var categoriesSelectorOutlet: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func selectorChanged(sender: AnyObject) {
        eventsToShow.removeAll(keepCapacity: true)

        switch categoriesSelectorOutlet.selectedSegmentIndex
        {
        case 0://enviroment
            for e in eventsManager.events{
                if(contains(e.tag, "environment")){
                    eventsToShow.append(e)
                }
            }
        case 1://food
            
            for e in eventsManager.events{
                if(contains(e.tag, "food")){
                    eventsToShow.append(e)
                }
            }
        case 2://community
            for e in eventsManager.events{
                if(contains(e.tag, "community")){
                    eventsToShow.append(e)
                }
            }
        default:
            break;
        }
        self.tableView.reloadData()
    }
    
    func load(){
        let url = NSURL(string: "https://api.myjson.com/bins/2lbg4")
        
        let dataTask = urlSession.dataTaskWithURL(url!, completionHandler: { data, response, error in
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            let eventsOptional = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary
            if let events = eventsOptional {
                
                var parsedEvents = [Event]()
                if let activities = events["activities"] as? NSArray {
                    for eventDictionary in activities {
                        parsedEvents.append(Event(eventDictionary:
                            eventDictionary as! [NSObject: AnyObject]))
                        
                        
                        self.eventsManager.events = parsedEvents
                        self.eventsToShow = self.eventsManager.events
                        self.tableView.reloadData()
                    }
                }
            }
            
        })
        
        dataTask.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "eventCell")
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        urlSession = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        
        self.load()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return eventsManager.events.count
        return eventsToShow.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! EventCell
        
        //let event = eventsManager.events[indexPath.row]
        let event = eventsToShow[indexPath.row]

        cell.titleOutlet.text = event.title
        cell.descriptionOutlet.text = event.eventDescription
        cell.locationOutlet.text = event.location
        cell.timeframeOutlet.text = event.timeframe
        
        //cell.imageViewOutlet.image = UIImage(data: NSData.dataWithContentsOfURL(url: ));

        
     if let imageURL = event.imageURL {
           downloadImageWithUrl(imageURL, forTableViewCell: cell)
        }
        
        return cell

    }
    var selectedRowIndex:NSIndexPath?
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //expand the selected cell
        selectedRowIndex = indexPath
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let selected = selectedRowIndex{
            if indexPath.row == selected.row{
                return 300
            }
        }
        return 180
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "signUpSegue" {
            if let destinationVC = segue.destinationViewController as? profileViewController{
            }
        }
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
                        cell?.imageViewOutlet.image = image.scaledImageToSize(CGSize(width: 40, height: 40))
                    }
                })
            
            imageDownloadTask.resume()
        }
    }

}

