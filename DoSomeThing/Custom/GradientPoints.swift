//
//  GradientPoints.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/14/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import Foundation
import UIKit
import Stevia

typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum GradientOrientation {
  case topRightBottomLeft
  case topLeftBottomRight
  case horizontal
  case vertical

var startPoint: CGPoint {
    return points.startPoint
}

var endPoint: CGPoint {
    return points.endPoint
}

var points: GradientPoints {
    switch self {
    case .topRightBottomLeft:
        return (CGPoint(x: 0.0, y: 1.0), CGPoint(x: 1.0, y: 0.0))
    case .topLeftBottomRight:
        return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 1, y: 1))
    case .horizontal:
        return (CGPoint(x: 0.0, y: 0.5), CGPoint(x: 1.0, y: 0.5))
    case .vertical:
        return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 0.0, y: 1.0))
    }
  }
}


extension UIView {

    
    
    func applyGradient(withColours colours: [UIColor], locations: [NSNumber]? = nil) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }

    func applyGradient(withColours colours: [UIColor], gradientOrientation orientation: GradientOrientation) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = orientation.startPoint
        gradient.endPoint = orientation.endPoint
        self.layer.insertSublayer(gradient, at: 0)
      }
    
   
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func shadow(){
        self.layer.cornerRadius = 6
        self.layer.shadowColor = UIColor.shadowColor().cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 12.0
        self.layer.shadowOpacity = 1
    }
    func shadowForCard(){
        self.layer.cornerRadius = 6
        self.layer.shadowColor = UIColor.shadowColorForCard().cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 12.0
        self.layer.shadowOpacity = 1
    }
    
}
