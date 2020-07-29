//
//  home.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/29/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import Foundation
struct Section {
   var nameSection: String
    var contents: [String]
}

func sectionData() -> [Section]{
    let section1 = Section(nameSection: "IT", contents: ["Quiz Game", "Design web", "abc"])
    let section2 = Section(nameSection: "Sáng tạo", contents: ["Machine learning", "Deep learning", "abc"])
    let section3 = Section(nameSection: "Kỹ sư", contents: ["Điện tử", "Điện lạnh", "abc"])
    
    return [section1, section2, section3]
}
