//
//  Constants.swift
//  Natasha
//  常量
//  Created by 1 on 10/6/2020.
//  Copyright © 2020 gzlh. All rights reserved.
//

import UIKit

let ScreenWith = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height
let KeyWindow = UIApplication.shared.keyWindow
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
let kBottomSafeAreaHeight:CGFloat = kStatusBarHeight > 20 ? 34:0
let kNavBarHeight:CGFloat = kStatusBarHeight + 44.0
let kTabBarHeight:CGFloat = kStatusBarHeight > 20 ? 83:49
let kCachePath=NSHomeDirectory()+"/Documents"

typealias SuccessBlock = ((Any?)->())?
typealias ErrorBlock = ((Any?)->())?
typealias BaseBlock = (()->())?

//保利威测试用账号：houtianyao@lilchain.com  ltwl8005
struct Constants {
    
    //第三方APP key
    struct VenderKey {

    }
    
    struct SandBoxPath {
        static let document = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        static let temp = NSTemporaryDirectory()
    }
}
