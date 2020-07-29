//
//  ITCollectionViewCell.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/29/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import Stevia
class ITCollectionViewCell: UICollectionViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.color01()
        view.layer.cornerRadius = 20
        return view
    }()
    let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    func setupLayout(){
        self.layout(
            20,
            |-20-containerView-20-|,
            20
        )
        containerView.layout(
            20,
            |-20-textLabel-20-|,
            20
        )
    }
    var onPress: (() -> Void)?
   var gallery: Photo? {
        didSet {
            if let gallery1 = gallery {
                textLabel.text = gallery1.text
            
                }
            }
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv(containerView)
        containerView.sv(textLabel)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

