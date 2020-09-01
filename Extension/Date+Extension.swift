//
//  DateExtension.swift
//  Hulk
//
//  Created by mac on 2020/6/17.
//  Copyright © 2020 gzlh. All rights reserved.
//

import Foundation

extension Date {
    /// 获取当前 秒级 时间戳 - 10位
    var timeStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }
    
    /// 获取当前 毫秒级 时间戳 - 13位
    var milliStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
    }
    
    func toString(formatterString: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formatterString
        formatter.locale = Locale(identifier: "zh")
        return formatter.string(from: self)
    }
}
