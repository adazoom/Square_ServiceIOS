//
//  profileViewController.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/21/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import Foundation
import UIKit

class profileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let eventsManager = EventsManager.sharedEventsManager
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named:"jackDorsey1.jpg")
        nameOutlet.text = "Jack Dorsey"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsManager.myEvents.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myEventCell", forIndexPath: indexPath) as! myEventCell
        var myEvent = eventsManager.myEvents[indexPath.row]
        cell.titleOutlet.text = myEvent.title
        cell.timeframeOutlet.text = myEvent.timeframe
        cell.descriptionOutlet.text = myEvent.eventDescription
        cell.locationOutlet.text = myEvent.location
        
        cell.imageView?.image = myEvent.image.scaledImageToSize(CGSize(width: 80, height: 80))
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }

    
}