//
//  EmployeeManager.swift
//  Square_ServiceIOS
//
//  Created by Aida Zhumabekova on 8/21/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import Foundation
import UIKit

class EmployeeManager {
    var employees = [Employee]()
    
    class var sharedEmployeeManager: EmployeeManager {
        struct Singleton {
            static let instance = EmployeeManager()
        }
        
        return Singleton.instance
    }
    
    init() {
        let  first = Employee(name: "Jack" , activity: "Code Camp", numHours: 12, image:  UIImage(named:"jackDorsey1.jpg"))
        employees.append(first)
        let  sec = Employee(name: "Sarah" , activity: "Child Care", numHours: 14, image:  UIImage(named:"SarahFriar.jpg"))
        employees.append(sec)
        let  thir = Employee(name: "Alyssa", activity: "Hackathon", numHours: 18, image:  UIImage(named:"AlyssaHenry.jpeg"))
        employees.append(thir)
        let  four = Employee(name: "Vanessa" , activity: "Baby Sit", numHours: 20, image:  UIImage(named:"VanessaSlavich.jpeg"))
        employees.append(four)
        let  fiv = Employee(name: "Gloria" , activity: "Education", numHours: 12, image:  UIImage(named:"GloriaKimbwala.jpeg"))
        employees.append(fiv)
        let  six = Employee(name: "Mia" , activity:  "Tech Tour", numHours: 21, image:  UIImage(named:"miaShackleford.jpeg"))
        employees.append(six)
        
        
    }
}
