//
//  UIViewControllerExtension.swift
//  Hulk
//
//  Created by mac on 2020/6/17.
//  Copyright © 2020 gzlh. All rights reserved.
//

import UIKit
extension UIViewController {
    /// 当前的控制器
    class func current() -> UIViewController? {
        var vc = UIApplication.shared.keyWindow?.rootViewController
        guard vc != nil else {
            return nil
        }
        vc = findCurrentViewController(vc: vc!)
        return vc
    }
    
    private class func findCurrentViewController(vc : UIViewController) -> UIViewController {
        
        if vc.presentedViewController != nil {
            return UIViewController.findCurrentViewController(vc: vc.presentedViewController!)
        } else if vc.isKind(of:UISplitViewController.self) {
            let svc = vc as! UISplitViewController
            if svc.viewControllers.count > 0 {
                return UIViewController.findCurrentViewController(vc: svc.viewControllers.last!)
            } else {
                return vc
            }
        } else if vc.isKind(of: UINavigationController.self) {
            let nvc = vc as! UINavigationController
            if nvc.viewControllers.count > 0 {
                return UIViewController.findCurrentViewController(vc: nvc.topViewController!)
            } else {
                return vc
            }
        } else if vc.isKind(of: UITabBarController.self) {
            let tvc = vc as! UITabBarController
            if (tvc.viewControllers?.count)! > 0 {
                return UIViewController.findCurrentViewController(vc: tvc.selectedViewController!)
            } else {
                return vc
            }
        } else {
            return vc
        }
    }

}


extension NSObject {
    
    struct RuntimeKey {
        static let gqBool = UnsafeRawPointer.init(bitPattern: "gqBool".hashValue)
        /// ...其他Key声明
        static let gqString = UnsafeRawPointer.init(bitPattern: "gqString".hashValue)
        static let gqIndexPath = UnsafeRawPointer.init(bitPattern: "gqIndexPath".hashValue)
        static let gqInt = UnsafeRawPointer.init(bitPattern: "gqInt".hashValue)
        static let gqDict = UnsafeRawPointer.init(bitPattern: "gqDict".hashValue)
        static let gqAny = UnsafeRawPointer.init(bitPattern: "gqAny".hashValue)
        static let gqReloadAction = UnsafeRawPointer.init(bitPattern: "gqReloadAction".hashValue)
    }
    
    var reloadAction: (()->())? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.gqReloadAction!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            objc_getAssociatedObject(self, UIButton.RuntimeKey.gqReloadAction!) as? (()->())
        }
    }
    
    var gqInt: Int? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.gqInt!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return  objc_getAssociatedObject(self, UIButton.RuntimeKey.gqInt!) as? Int
        }
    }
    
    var gqString: String? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.gqString!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return  objc_getAssociatedObject(self, UIButton.RuntimeKey.gqString!) as? String
        }
    }
    
    var gqIndexPath: IndexPath? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.gqIndexPath!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return  objc_getAssociatedObject(self, UIButton.RuntimeKey.gqIndexPath!) as? IndexPath
        }
    }
    
    
    var gqBool: Bool? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.gqBool!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return  objc_getAssociatedObject(self, UIButton.RuntimeKey.gqBool!) as? Bool
        }
    }
    
    var gqDict: [String:Any]? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.gqDict!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return  objc_getAssociatedObject(self, UIButton.RuntimeKey.gqDict!) as? [String:Any]
        }
    }
    
    
    var gqAny: Any? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.gqAny!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return  objc_getAssociatedObject(self, UIButton.RuntimeKey.gqAny!)
        }
    }
}
