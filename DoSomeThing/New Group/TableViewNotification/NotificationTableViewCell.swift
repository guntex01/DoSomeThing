//
//  NotificationTableViewCell.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/29/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    var a: Notification? {
        didSet {
            if let data = a {
                avatarImage.image = data.avatarImage
                contentLabel.text = data.content
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImage.layer.cornerRadius = avatarImage.bounds.height/2
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.borderColor = UIColor.white.cgColor
        contentLabel.numberOfLines = 0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
