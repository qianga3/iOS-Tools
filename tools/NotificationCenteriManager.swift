//
//  NotifiManager.swift
//  Hulk
//
//  Created by mac on 2020/6/18.
//  Copyright © 2020 gzlh. All rights reserved.
//

import Foundation

let kNotificationCenter = NotificationCenter.default

enum NotificationKey: String {
    ///登录状态改变
    case loginStateChange = "loginStateChange"
    
    var stringValue: String {
        return rawValue + "Noification"
    }
    
    var name: Notification.Name {
        return Notification.Name(stringValue)
    }
}

func postNotification(_ key: NotificationKey, userInfo: [NotificationUserInfoKey: Any]? = nil) {
    NotificationCenter.default.post(name: key.name, object: nil, userInfo: userInfo)
}

enum NotificationUserInfoKey: String {
    case loginState = "loginState"
    case changeSubject = "changeSubject"
}
