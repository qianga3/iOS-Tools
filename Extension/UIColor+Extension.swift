//
//  UIColor+Extension.swift
//  ActiveProject
//
//  Created by Lee on 2018/8/14.
//  Copyright © 2018年 7moor. All rights reserved.
//

import UIKit

private extension Int64 {
    func duplicate4bits() -> Int64 {
        return (self << 4) + self
    }
}

extension UIColor {
    
    private convenience init?(hex3: Int64, alpha: Float) {
         self.init(red:   CGFloat( ((hex3 & 0xF00) >> 8).duplicate4bits() ) / 255.0,
                   green: CGFloat( ((hex3 & 0x0F0) >> 4).duplicate4bits() ) / 255.0,
                   blue:  CGFloat( ((hex3 & 0x00F) >> 0).duplicate4bits() ) / 255.0,
                   alpha: CGFloat(alpha))
     }

     private convenience init?(hex4: Int64, alpha: Float?) {
         self.init(red:   CGFloat( ((hex4 & 0xF000) >> 12).duplicate4bits() ) / 255.0,
                   green: CGFloat( ((hex4 & 0x0F00) >> 8).duplicate4bits() ) / 255.0,
                   blue:  CGFloat( ((hex4 & 0x00F0) >> 4).duplicate4bits() ) / 255.0,
                   alpha: alpha.map(CGFloat.init(_:)) ?? CGFloat( ((hex4 & 0x000F) >> 0).duplicate4bits() ) / 255.0)
     }

     private convenience init?(hex6: Int64, alpha: Float) {
         self.init(red:   CGFloat( (hex6 & 0xFF0000) >> 16 ) / 255.0,
                   green: CGFloat( (hex6 & 0x00FF00) >> 8 ) / 255.0,
                   blue:  CGFloat( (hex6 & 0x0000FF) >> 0 ) / 255.0, alpha: CGFloat(alpha))
     }

     private convenience init?(hex8: Int64, alpha: Float?) {
         self.init(red:   CGFloat( (hex8 & 0xFF000000) >> 24 ) / 255.0,
                   green: CGFloat( (hex8 & 0x00FF0000) >> 16 ) / 255.0,
                   blue:  CGFloat( (hex8 & 0x0000FF00) >> 8 ) / 255.0,
                   alpha: alpha.map(CGFloat.init(_:)) ?? CGFloat( (hex8 & 0x000000FF) >> 0 ) / 255.0)
     }

     /**
      Create non-autoreleased color with in the given hex string and alpha.

      - parameter hexString: The hex string, with or without the hash character.
      - parameter alpha: The alpha value, a floating value between 0 and 1.
      - returns: A color with the given hex string and alpha.
      */
     convenience init?(hexString: String, alpha: Float? = nil) {
         var hex = hexString

         // Check for hash and remove the hash
         if hex.hasPrefix("#") {
             hex = String(hex[hex.index(after: hex.startIndex)...])
         }

         guard let hexVal = Int64(hex, radix: 16) else {
             self.init()
             return nil
         }

         switch hex.count {
         case 3:
             self.init(hex3: hexVal, alpha: alpha ?? 1.0)
         case 4:
             self.init(hex4: hexVal, alpha: alpha)
         case 6:
             self.init(hex6: hexVal, alpha: alpha ?? 1.0)
         case 8:
             self.init(hex8: hexVal, alpha: alpha)
         default:
             // Note:
             // The swift 1.1 compiler is currently unable to destroy partially initialized classes in all cases,
             // so it disallows formation of a situation where it would have to.  We consider this a bug to be fixed
             // in future releases, not a feature. -- Apple Forum
             self.init()
             return nil
         }
     }

     /**
      Create non-autoreleased color with in the given hex value and alpha

      - parameter hex: The hex value. For example: 0xff8942 (no quotation).
      - parameter alpha: The alpha value, a floating value between 0 and 1.
      - returns: color with the given hex value and alpha
      */
     convenience init?(hex: Int, alpha: Float = 1.0) {
         if (0x000000 ... 0xFFFFFF) ~= hex {
             self.init(hex6: Int64(hex), alpha: alpha)
         } else {
             self.init()
             return nil
         }
     }
}

extension UIColor {
    
    ///UIColor 转换 uiimage
    public func toImage() -> UIImage {
        // 描述矩形
        let rect: CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        // 开启位图上下文
        UIGraphicsBeginImageContext(rect.size)
        // 获取位图上下文
        let context: CGContext = UIGraphicsGetCurrentContext()!
        // 使用color演示填充上下文
        context.setFillColor(self.cgColor)
        // 渲染上下文
        context.fill(rect)
        // 从上下文中获取图片
        let theImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // 结束上下文
        UIGraphicsEndImageContext()
        return theImage
    }
    
}


extension UIColor {
    public static var color000: UIColor {
        get {
            UIColor.init(hexString: "000000")!
        }
    }
    
    public static var colore3e3e3: UIColor {
         get {
             UIColor.init(hexString: "#E3E3E3")!
         }
     }
    
    public static var color3480FF: UIColor {
        get {
            UIColor.init(hexString: "#3480FF")!
        }
    }
    
    public static var color666: UIColor {
        get {
            UIColor.init(hexString: "#666666")!
        }
    }
    
    public static var color333: UIColor {
        get {
            UIColor.init(hexString: "333333")!
        }
    }
    
    public static var color999: UIColor {
        get {
            UIColor.init(hexString: "999999")!
        }
    }
    
    public static var colorD4E4FF: UIColor {
        get {
            UIColor.init(hexString: "D4E4FF")!
        }
    }
    
    public static var colorFD780B: UIColor {
        get {
            UIColor.init(hexString: "#FD780B")!
        }
    }
    
    public static var colorFFE6D2: UIColor {
        get {
            UIColor.init(hexString: "#FFE6D2")!
        }
    }
    
    public static var colorE2E4EA: UIColor {
        get {
            UIColor.init(hexString: "#E2E4EA")!
        }
    }
    
    public static var coloreeeeee: UIColor {
         get {
             UIColor.init(hexString: "#eeeeee")!
         }
     }
    
    public static var colorF4F4F4: UIColor {
        get {
            UIColor.init(hexString: "#F4F4F4")!
        }
    }
    
    public static var colorF8F8F8: UIColor {
        get {
            UIColor.init(hexString: "#F8F8F8")!
        }
    }
    
    public static var colorFFDABB: UIColor {
        get {
            UIColor.init(hexString: "#FFDABB")!
        }
    }
    
    public static var colorFC0100: UIColor {
        get {
            UIColor.init(hexString: "#FC0100")!
        }
    }
    
    public static var color00C15D: UIColor {
        get {
            UIColor.init(hexString: "#00C15D")!
        }
    }
    
    public static var color121212: UIColor {
        get {
            UIColor.init(hexString: "#121212")!
        }
    }
    
    public static var color181818: UIColor {
        get {
            UIColor.init(hexString: "#181818")!
        }
    }
    
}
