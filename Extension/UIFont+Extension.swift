//
//  UIFontExtension.swift
//  Hulk
//
//  Created by mac on 2020/6/18.
//  Copyright © 2020 gzlh. All rights reserved.
//

import UIKit

extension UIFont {
    
    /// 常规体（Regular）
    ///
    /// - Parameter size: 字体大小
    class func font(size:CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Regular", size: size) ?? UIFont.systemFont(ofSize:size)
    }
    
    /// Medium（Medium）
    ///
    /// - Parameter size: 字体大小
    class func fontMedium(size:CGFloat) -> UIFont {
        return UIFont.init(name: "PingFang-SC-Medium", size: size) ?? UIFont.systemFont(ofSize:size)
    }
    
    /// Semibold（PingFangSC-Semibold）
    ///
    /// - Parameter size: 字体大小
    class func fontBold(size:CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Semibold", size: size) ?? UIFont.systemFont(ofSize:size)
    }
    
    class func fontLight(size:CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Light", size: size) ?? UIFont.systemFont(ofSize:size)
    }
    
    //数字字体
    class func fontDINMedium(size: CGFloat) -> UIFont {
        return UIFont.init(name: "DIN-Medium", size: size) ?? UIFont.systemFont(ofSize:size)
    }
}

extension UIFont {
    
    public static var medium18: UIFont {
        get {
            .medium(size: 18)
        }
    }
    
    public static var medium16: UIFont {
        get {
            .medium(size: 16)
        }
    }
    
    public static var medium24: UIFont {
        get {
            .medium(size: 24)
        }
    }
    
    public static var medium21: UIFont {
        get {
            .medium(size: 21)
        }
    }
    
    public static var medium14: UIFont {
        get {
            .medium(size: 14)
        }
    }
    
    public static var regular18: UIFont {
        get {
            .regular(size: 18)
        }
    }
    
    public static var regular16: UIFont {
        get {
            .regular(size: 16)
        }
    }

    
    public static var regular14: UIFont {
        get {
            .regular(size: 14)
        }
    }
    
    public static var regular12: UIFont {
        get {
            .regular(size: 12)
        }
    }
    
    
    public static var regular10: UIFont {
        get {
            .regular(size: 10)
        }
    }
    
    public static var regular20: UIFont {
         get {
             .regular(size: 20)
         }
     }
     
    
    public static var regular13: UIFont {
          get {
              .regular(size: 13)
          }
      }
    
    
    static func medium(size: CGFloat) -> UIFont {
        return .fontMedium(size: size)
    }
    
    static func regular(size: CGFloat) -> UIFont {
        return .font(size: size)
    }
    
    // MAKR: 数字字体
    
    public static var DINMeiunm16: UIFont {
        get {
            .DINMeiunm(size: 16)
        }
    }
    
    public static var DINMeiunm14: UIFont {
        get {
            .DINMeiunm(size: 14)
        }
    }
    
    public static var DINMeiunm18: UIFont {
        get {
            .DINMeiunm(size: 18)
        }
    }
    
    public static var DINMeiunm21: UIFont {
        get {
            .DINMeiunm(size: 21)
        }
    }
    
    static func DINMeiunm(size: CGFloat) -> UIFont {
        return .fontDINMedium(size: size)
    }
}
