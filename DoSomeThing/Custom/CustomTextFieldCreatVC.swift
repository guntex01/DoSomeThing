//
//  CustomTextFieldCreatVC.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/28/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class CustomTextFieldCreatVC: UITextField {
    var placeHolder = NSMutableAttributedString()
    init(_ plachoder: String, _ backgroundColor: UIColor,_ textColor: UIColor, _ plachoderColor: UIColor, _ frame: CGRect) {
        super.init(frame: frame)
        
        self.placeholder = plachoder
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        placeHolder = NSMutableAttributedString(string: plachoder, attributes: [:])
        placeHolder.addAttribute(.foregroundColor, value: UIColor.plachoder(), range: NSRange(location: 0, length: plachoder.count))
        self.attributedPlaceholder = placeHolder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
    override func draw(_ rect: CGRect) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lane().cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
