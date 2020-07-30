//
//  ConvertHelper.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/30/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import Foundation

class ConvertHelper {
    static func stringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let string = formatter.string(from: date)
        return string
    }
}
