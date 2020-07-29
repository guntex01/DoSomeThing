//
//  UIView.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/21/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
class CustomView: UIView {
    
    var contentView : UIView?
    let myrequestLogo: UIImageView = {
       let image = UIImageView(image: UIImage(named: "b"))
           return image
       }()
       let myrequestLabel: UILabel = {
       let label = UILabel()
           label.text("Yêu cầu của bạn")
           return label
       }()
    let nextButton: UIButton = {
    let button = UIButton()
        button.setBackgroundImage(UIImage(named: "nextsk"), for: .normal)
        return button
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        contentView?.prepareForInterfaceBuilder()
    }
    
    func setup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomView", bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
    
}
