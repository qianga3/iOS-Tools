//
//  UserDefaultsExtension.swift
//  Hulk
//
//  Created by mac on 2020/6/18.
//  Copyright © 2020 gzlh. All rights reserved.
//

import Foundation

import UIKit
protocol UserDefaultNameSpace { }

extension UserDefaultNameSpace {
    static func namespace<T>(_ key:T) -> String where T :RawRepresentable {
        return "\(Self.self).\(key.rawValue) "
    }
}

protocol UserDefaultSettable : UserDefaultNameSpace {
    associatedtype UserDefaultKey : RawRepresentable
}

extension UserDefaultSettable where UserDefaultKey.RawValue == String {}

extension UserDefaultSettable {
    
    /// 关于 Int 类型存储和读取
    static func set(value:Int, forKey key:UserDefaultKey){
        let key = namespace(key)
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func integer(forKey key:UserDefaultKey) -> Int {
        let key = namespace(key)
        return UserDefaults.standard.integer(forKey: key)
    }
    
    /// 关于 String 类型存储和读取
    static func set(value:Any?, forKey key:UserDefaultKey){
        let key = namespace(key)
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func string(forKey key:UserDefaultKey) -> String? {
        let key = namespace(key)
        return UserDefaults.standard.string(forKey: key)
    }
    
    static func bool(forKey key:UserDefaultKey) -> Bool? {
        let key = namespace(key)
        return UserDefaults.standard.bool(forKey: key)
    }
    
    static func remove(forkey key: UserDefaultKey){
        let key = namespace(key)
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    static func any(forkey key: UserDefaultKey) -> Any{
        let key = namespace(key)
        return UserDefaults.standard.object(forKey: key) as Any
    }
}

extension UserDefaults {
    
    /*! 关于账号的信息 Key 都放在这里 */
    struct Account: UserDefaultSettable {
        enum UserDefaultKey : String {
            case phone
            //电话号码
            case phoneNum
        }
    }
    
}
