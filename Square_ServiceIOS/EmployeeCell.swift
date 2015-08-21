//
//  EmployeeCell.swift
//  Square_ServiceIOS
//
//  Created by code camp on 8/19/15.
//  Copyright (c) 2015 Aida Zhumabekova. All rights reserved.
//

import UIKit


class EmployeeCell: UITableViewCell {
    
    @IBOutlet weak var employeeImage: UIImageView!
    
    @IBOutlet weak var employeeLabel: UILabel!
    
    @IBOutlet weak var employeeOpportunity: UILabel!

    @IBOutlet weak var employeeHours: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.employeeImage.layer.masksToBounds = true
        self.employeeImage.layer.opaque = false;
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.employeeImage.layer.cornerRadius = employeeImage.bounds.width / 2.0
       // self.employeeImage.clipsToBounds = true
    }

}