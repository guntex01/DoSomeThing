//
//  MessagerTableViewCell.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/23/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class MessagerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    var person: Person? {
        didSet {
            if let data = person {
                avatarImage.image = data.avatarImage
                nameLabel.text = data.name
                messageLabel.text = data.message
                dayLabel.text = data.time
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.layer.cornerRadius = avatarImage.bounds.height/2
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.borderColor = UIColor.white.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
