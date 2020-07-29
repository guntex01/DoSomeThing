//
//  IT.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/6/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
struct Gallery {
    var motoImages: [Photo]
    
}

struct Photo {
    var text: String
   }
func fakeDatas() -> [Gallery] {
return [
    Gallery( motoImages: [
        Photo(text: "abc"),
        Photo(text: "bcs"),
        Photo(text: "bcs"),
        Photo(text: "bcs"),
        Photo(text: "bcs"),
        Photo(text: "bcs"),
    ])
        ]
}
