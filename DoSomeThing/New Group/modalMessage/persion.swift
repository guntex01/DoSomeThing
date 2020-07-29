//
//  persion.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/23/20.
//  Copyright © 2020 guntex01. All rights reserved.
//


import UIKit
struct Person {
    var name: String
    var message: String
    var time: String
    var avatarImage: UIImage
}

func fakeData() -> [Person] {
    let person1 = Person.init(name: "Ninh", message: "An suas viderer pro. Vis cu magna altra , ex his vivendo atomorum", time: "today", avatarImage: UIImage(named: "nen1")!)
    let person2 = Person.init(name: "Phương", message: "An suas viderer pro. Vis cu magna altra , ex his vivendo atomorum", time: "today", avatarImage: UIImage(named: "nen1")!)
    let person3 = Person.init(name: "Định", message: "An suas viderer pro. Vis cu magna altra , ex his vivendo atomorum", time: "today", avatarImage: UIImage(named: "nen1")!)
    
    return [person1, person2, person3]
}
