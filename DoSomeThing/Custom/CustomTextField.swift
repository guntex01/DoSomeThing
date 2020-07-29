//
//  CustomTextField.swift
//  DoSomeThing
//
//  Created by guntex01 on 6/26/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
class CustomTextField: UITextField {
var placeHolder = NSMutableAttributedString()
    init(_ plachoder: String, _ backgroundColor: UIColor,_ textColor: UIColor, _ plachoderColor: UIColor, _ frame: CGRect) {
        super.init(frame: frame)
        
        self.placeholder = plachoder
        self.backgroundColor = backgroundColor
        self.textColor = textColor
//        placeHolder = NSMutableAttributedString(string: plachoder, attributes: [:])
//        placeHolder.addAttribute(.foregroundColor, value: UIColor.placeholderText, range: NSRange(location: 0, length: plachoder.count))
//        self.attributedPlaceholder = placeHolder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
    override func draw(_ rect: CGRect) {
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        self.leftViewMode = UITextField.ViewMode.always
    }
}
