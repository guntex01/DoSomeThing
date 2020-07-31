//
//  InformationTableViewCell.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/23/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var textLB: UILabel!
    @IBOutlet weak var rightLogo: UIImageView!
    
    var infomation: Information? {
        didSet {
            if let dataInfomation = infomation {
                logo.image = dataInfomation.logoImage
                textLB.text = dataInfomation.textLabel
                rightLogo.image = dataInfomation.nextImage
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
