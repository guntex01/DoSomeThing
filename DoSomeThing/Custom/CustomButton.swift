//
//  CustomButton.swift
//  DoSomeThing
//
//  Created by guntex01 on 6/26/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
class CustomButton: UIButton {
    
    init(_ title: String, _ backgroundColor: UIColor,_ titleColor: UIColor ,_ frame: CGRect, _ font: UIFont) {
        super.init(frame: frame)
        
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.setTitleColor(titleColor, for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        
        self.layer.cornerRadius = self.bounds.height/2
        self.layer.masksToBounds = true
        
    }
    
}
