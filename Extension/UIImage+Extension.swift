//
//  UIImage+Extension.swift
//  Hulk
//
//  Created by mac on 2020/6/19.
//  Copyright © 2020 gzlh. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func initWith(_ color: UIColor) -> UIImage{
        // 描述矩形
        let rect: CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        // 开启位图上下文
        UIGraphicsBeginImageContext(rect.size)
        // 获取位图上下文
        let context: CGContext = UIGraphicsGetCurrentContext()!
        // 使用color演示填充上下文
        context.setFillColor(color.cgColor)
        // 渲染上下文
        context.fill(rect)
        // 从上下文中获取图片
        let theImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // 结束上下文
        UIGraphicsEndImageContext()
        return theImage
        
    }
    
    func redrew() -> UIImage?{
        let width = size.width
        let height = size.height
        
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
}

