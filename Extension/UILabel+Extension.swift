//
//  UILabel+Extension.swift
//  PadSole
//
//  Created by apple on 2019/4/11.
//  Copyright © 2019 Lee. All rights reserved.
//

import UIKit
extension UILabel {
    func set(_ textColor: UIColor, _ textFont: UIFont ,_ textAligent: NSTextAlignment = .left) {
        self.textAlignment = textAligent
        self.textColor = textColor
        self.font = textFont
    }
    
    convenience init(frame:CGRect,text:String?,textColor:UIColor?,font:UIFont?,textAligment:NSTextAlignment?) {
        self.init(frame: frame)
        self.textColor = textColor
        self.font = font
        self.text = text
        if textAligment != nil {
            self.textAlignment = textAligment!
        }
    }
}

