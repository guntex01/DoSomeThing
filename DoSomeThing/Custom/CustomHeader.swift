//
//  CustomHeader.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/28/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import Stevia
class CustomHeader: UIView {
   
    let containerView: UIView = {
    let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lane().cgColor
        return view
    }()
    let nameLabel: UILabel = {
    let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    let moreButton: UIButton = {
    let button = UIButton()
        button.setTitleColor(UIColor.color01(), for: .normal)
        return button
    }()
    var passSection : (() -> Void)?
   var section = Int()
    func setuplayout(){
        self.layout(
        0,
        |-0-containerView-0-|,
        0
        )
        containerView.layout(
        0,
        |-20-nameLabel.width(100)-200-moreButton.width(100)-10-|,
        0
        )
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.sv(containerView)
        moreButton.addTarget(self, action: #selector(push), for: .touchUpInside)
        containerView.sv([nameLabel, moreButton])
        
        setuplayout()
        
    }
    @objc func push(){
        passSection?()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
    }
}
