//
//  LogInViewController.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/21/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let pieVC = MasterViewController(nibName: "MasterViewController", bundle: nil)
    
    @IBOutlet weak var passwordOutlet: UITextField!
   
    @IBOutlet weak var usernameOutlet: UITextField!
    
    @IBAction func logInPressed(sender: AnyObject) {
        if(usernameOutlet.text == "volunteer" && passwordOutlet.text == "123"){
            
        }else{
            var alert = UIAlertController(title: "Alert", message: "Incorrect password or username", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
}
