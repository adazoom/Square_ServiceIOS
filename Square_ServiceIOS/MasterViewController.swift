//
//  MasterViewController.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/18/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private let employeeManager = EmployeeManager.sharedEmployeeManager


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
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
        return employeeManager.employees.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("EmployeeCell", forIndexPath: indexPath) as! EmployeeCell
        var employee = employeeManager.employees[indexPath.row]
        cell.employeeLabel.text = employee.name
        cell.employeeHours.text = String(employee.numHours)
        cell.employeeOpportunity.text = employee.activity
        
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.opaque = false;
        
        cell.imageView?.image = employee.image
        
        return cell
    }
    
}

