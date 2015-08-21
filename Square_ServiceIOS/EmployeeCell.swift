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
        self.employeeImage.layer.masksToBounds = true
        self.employeeImage.layer.opaque = false;
        // Initialization code
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.employeeImage.layer.cornerRadius = employeeImage.bounds.width / 2.0
        self.employeeImage.clipsToBounds = true
        //employeeImage.image.round()
    }

}

public extension UIView {
    public func round() {
        let width = bounds.width < bounds.height ? bounds.width : bounds.height
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(ovalInRect: CGRectMake(bounds.midX - width / 2, bounds.midY - width / 2, width, width)).CGPath
        self.layer.mask = mask
}
}