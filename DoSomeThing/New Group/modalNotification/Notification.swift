//
//  Notification.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/29/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
struct Notification {
    var content: String
    var avatarImage: UIImage
}

func fakeData() -> [Notification] {
    let notification1 = Notification.init(content: "An suas viderer pro. Vis cu magna altra , ex his vivendo atomorum", avatarImage: UIImage(named: "nen1")!)
    let notification2 = Notification.init(content: "An suas viderer pro. Vis cu magna altra , ex his vivendo atomorum", avatarImage: UIImage(named: "nen1")!)
    let notification3 = Notification.init(content: "An suas viderer pro. Vis cu magna altra , ex his vivendo atomorum", avatarImage: UIImage(named: "nen1")!)
    let notification4 = Notification.init(content: "An suas viderer pro. Vis cu magna altra , ex his vivendo atomorum", avatarImage: UIImage(named: "nen1")!)
    let notification5 = Notification.init(content: "An suas viderer pro. Vis cu magna altra , ex his vivendo atomorum", avatarImage: UIImage(named: "nen1")!)
    
    return [notification1,notification2,notification3,notification4,notification5]
}
