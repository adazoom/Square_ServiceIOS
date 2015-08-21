//
//  MasterViewController.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/18/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var detailViewController: DetailViewController? = nil
    var urlSession: NSURLSession!
    var objects = NSMutableArray()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

 /*   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }*/

    // MARK: - Table View

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    var employees: Array<Dictionary<String, NSObject>> = [
        ["hours" : "12", "activity" : "Code Camp", "name" : "Jack" ],
        ["hours" : "14", "activity" : "Child Care", "name" : "Sarah" ],
        ["hours" : "16", "activity" : "Hackathon", "name" : "Alyssa" ],
        ["hours" : "18", "activity" : "Baby Sit", "name" : "Vanessa" ],
        ["hours" : "20", "activity" : "Education", "name" : "Gloria" ],
        ["hours" : "12", "activity" : "Tech Tour", "name" : "Mia" ]
    ]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("EmployeeCell", forIndexPath: indexPath) as! EmployeeCell
        var employee = employees[indexPath.row]
        cell.employeeLabel.text = employee["name"] as? String
        cell.employeeHours.text = employee["hours"] as? String
        cell.employeeOpportunity.text = employee["activity"] as? String
        
        return cell
        

//        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

