//
//  EmployeeCell.swift
//  Square_ServiceIOS
//
//  Created by code camp on 8/19/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import Foundation
import UIKit

class EmployeeCell: UITableViewCell {
    
    @IBOutlet weak var employeeImage: UIImageView!
    
    @IBOutlet weak var employeeLabel: UILabel!
    
    @IBOutlet weak var employeeOpportunity: UILabel!

    @IBOutlet weak var employeeHours: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}