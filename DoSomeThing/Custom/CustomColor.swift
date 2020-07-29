//
//  CustomColor.swift
//  DoSomeThing
//
//  Created by guntex01 on 6/24/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import Foundation
import  UIKit

extension UIColor {
    class func imageColor() -> UIColor {
        return UIColor(red: 0.00, green: 0.80, blue: 0.60, alpha: 1.00)
    }
    class func shadowColor() ->UIColor {
        return UIColor(red: 0.62, green: 0.64, blue: 0.71, alpha: 0.20)
    }
    class func shadowColorForCard() ->UIColor {
        return UIColor(red: 0.62, green: 0.64, blue: 0.71, alpha: 0.16)
    }
    class func color01() ->UIColor {
        return UIColor(red: 0.00, green: 0.90, blue: 0.67, alpha: 1.00)
    }
    class func plachoder() -> UIColor {
        return #colorLiteral(red: 0.4390351772, green: 0.4430349469, blue: 0.451287508, alpha: 1)
    }
    class func lane() -> UIColor {
           return UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
       }
}
