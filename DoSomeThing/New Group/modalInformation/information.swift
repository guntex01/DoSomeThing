//
//  information.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/23/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
struct Information {
    var logoImage: UIImage
    var textLabel: String
    var nextImage: UIImage
}

func fakeData() -> [Information] {
    let infomation1 = Information(logoImage: UIImage(named: "a")!, textLabel: "Yêu cầu của bạn", nextImage: UIImage(named: "nextsk")!)
    let infomation2 = Information(logoImage: UIImage(named: "b")!, textLabel: "Yêu cầu đã nhận", nextImage: UIImage(named: "nextsk")!)
    let infomation3 = Information(logoImage: UIImage(named: "setting")!, textLabel: "Cài đặt", nextImage: UIImage(named: "nextsk")!)
    let infomation4 = Information(logoImage: UIImage(named: "logout")!, textLabel: "Đăng xuât", nextImage: UIImage(named: "nextsk")!)
    
    return [infomation1, infomation2, infomation3, infomation4]
}
