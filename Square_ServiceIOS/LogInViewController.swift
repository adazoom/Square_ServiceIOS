//
//  LogInViewController.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/21/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import Foundation
import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordOutlet.delegate=self
        usernameOutlet.delegate=self
    }
    
    @IBOutlet weak var passwordOutlet: UITextField!
   
    @IBOutlet weak var usernameOutlet: UITextField!
    
    @IBAction func logInPressed(sender: AnyObject) {
        if(usernameOutlet.text == "volunteer" && passwordOutlet.text == "123"){
            println("accsess granted")
        }else{
            var alert = UIAlertController(title: "Alert", message: "Incorrect password or username", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
}
