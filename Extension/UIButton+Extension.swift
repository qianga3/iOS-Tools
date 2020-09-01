//
//  UIButtonExtension.swift
//  Hulk
//
//  Created by mac on 2020/6/17.
//  Copyright © 2020 gzlh. All rights reserved.
//

import UIKit


extension UIButton {
    
    convenience init(type:UIButton.ButtonType = .custom,frame:CGRect,title:String?,titleColor:UIColor?,imageName:String?,backColor: UIColor?,target: AnyObject,action:Selector, font: UIFont? = .regular16) {
        self.init(type: type)
        self.frame = frame
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
        backgroundColor = backColor
        if imageName != nil {
            setImage(UIImage(named: imageName!), for: .normal)
        }
        //添加响应事件
        addTarget(target, action: action, for: .touchUpInside)
    }
    
    convenience init(type:UIButton.ButtonType = .custom,frame:CGRect,title:String?,font:UIFont? = .regular16,titleColor:UIColor?,imageName:String?) {
        self.init(type: type)
        self.frame = frame
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
        if imageName != nil {
            self.setImage(UIImage(named: imageName!), for: .normal)
        }
    }
    
    
    func hulAddTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event = UIControl.Event.touchUpInside) {
        self.addTarget(target, action: action, for: controlEvents)
    }
    
    func set(text: String, color: UIColor, font: UIFont, bgColor: UIColor,_ target: Any?, action: Selector, for controlEvents: UIControl.Event = UIControl.Event.touchUpInside){
        self.setTitle(text, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = font
        self.backgroundColor = bgColor
        self.addTarget(target, action: action, for: controlEvents)
    }
    
    /// 按钮布局样式（图片+文字）
    enum LayoutStyle:UInt8 {
        ///图片在上面
        case imageTop
        ///图片在下面
        case imageBottom
        ///图片在左边
        case imageLeft
        ///图片在右边
        case imageRight
    }
    
    /// 按钮的文字与图片位置布局,（在布局完以后再调用此方法，不然UI上可能会出错）
    ///
    /// - Parameters:
    ///   - style: 样式
    ///   - padding: 间距（图片与文字间的间距）
    func layout(_ style: LayoutStyle, padding: CGFloat = 2.0){
        self.contentMode = .center
        /**
         *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
         *  如果只有title，那它上下左右都是相对于button的，image也是一样；
         *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
         */
        // 1. 得到imageView和titleLabel的宽、高
        let imageWith = self.imageView?.frame.size.width ?? 0.0
        let imageHeight = self.imageView?.frame.size.height ?? 0.0
        let labelWidth = self.titleLabel?.intrinsicContentSize.width ?? 0.0
        let labelHeight = self.titleLabel?.intrinsicContentSize.height ?? 0.0
        
        // 2. 声明imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        // 3. 根据style和padding得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .imageTop:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight-padding/2.0, left: 0, bottom: 0, right: -labelWidth/2);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith, bottom: -imageHeight-padding/2.0, right: 0);
        case .imageBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-padding/2.0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-padding/2.0, left: -imageWith, bottom: 0, right: 0);
        case .imageLeft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -padding/2.0, bottom: 0, right: padding/2.0);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: padding/2.0, bottom: 0, right: -padding/2.0);
        case .imageRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+padding/2.0, bottom: 0, right: -(labelWidth+padding/2.0));
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWith+padding/2.0), bottom: 0, right: imageWith+padding/2.0);
        }
        
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
        
    }
    
    enum ButtonEdgeInsetsStyle {
        case ButtonEdgeInsetsStyleTop // image在上，label在下
        case ButtonEdgeInsetsStyleLeft  // image在左，label在右
        case ButtonEdgeInsetsStyleBottom  // image在下，label在上
        case ButtonEdgeInsetsStyleRight // image在右，label在左
    }
    
    func layoutButtonEdgeInsets(style:ButtonEdgeInsetsStyle,space:CGFloat) {
        var labelWidth : CGFloat = 0.0
        var labelHeight : CGFloat = 0.0
        var imageEdgeInset = UIEdgeInsets.zero
        var labelEdgeInset = UIEdgeInsets.zero
        let imageWith = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        if Double(UIDevice.current.systemVersion) ?? 0 >= 8.0 {
            labelWidth = (self.titleLabel?.intrinsicContentSize.width)!
            labelHeight = (self.titleLabel?.intrinsicContentSize.height)!
        }else {
            labelWidth = (self.titleLabel?.frame.size.width)!
            labelHeight = (self.titleLabel?.frame.size.height)!
        }
        switch style {
        case .ButtonEdgeInsetsStyleTop:
            imageEdgeInset = UIEdgeInsets(top: -labelHeight-space/2.0, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInset = UIEdgeInsets(top: 0, left: -imageWith!, bottom: -imageHeight!-space/2.0, right: 0)
        case .ButtonEdgeInsetsStyleLeft:
            imageEdgeInset = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0);
            labelEdgeInset = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0);
        case .ButtonEdgeInsetsStyleBottom:
            imageEdgeInset = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth)
            labelEdgeInset = UIEdgeInsets(top: -imageHeight!-space/2.0, left: -imageWith!, bottom: 0, right: 0)
        case .ButtonEdgeInsetsStyleRight:
            // To Do print("坐标是====\(labelWidth)=====\(space)")
            imageEdgeInset = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
            labelEdgeInset = UIEdgeInsets(top: 0, left: -imageWith!-space/2.0, bottom: 0, right: imageWith!+space/2.0)
        }
        self.titleEdgeInsets = labelEdgeInset
        self.imageEdgeInsets = imageEdgeInset
    }
    
    func animationCodeBtn(second: Int, done:@escaping ()->()){
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .lightGray
        if second != 0 {
            let title = "(\(second)秒)"
            self.setTitle(title, for: .normal)
      
            self.isEnabled = false
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now()+1) {
                DispatchQueue.main.async {
                    self.animationCodeBtn(second: second - 1, done: done)
                }
            }
        }else{
            self.isEnabled = true
            self.setTitle("获取验证码", for: .normal)
            self.setTitleColor(.white, for: .normal)
            done()
        }
    }

}

extension UIButton {
    
    func showIndicator(style: UIActivityIndicatorView.Style = .white) {
        let indicator = UIActivityIndicatorView.init(style: style)
        indicator.center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        indicator.startAnimating()
        
        let currentButtonText = titleLabel?.text ?? ""
        let currentButtonImg = imageView?.image ?? UIImage()
        objc_setAssociatedObject(self, UnsafeRawPointer.init(bitPattern: "buttonTextObject".hashValue)!, currentButtonText, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self, UnsafeRawPointer.init(bitPattern: "indicatorView".hashValue)!, indicator, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self, UnsafeRawPointer.init(bitPattern: "buttonImageObject".hashValue)!, currentButtonImg, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        isEnabled = false
        setTitle("", for: .normal)
        setImage(nil, for: .normal)
        addSubview(indicator)
    }
    
    func hideIndicator() {
        let currentButtonText = (objc_getAssociatedObject(self, UnsafeRawPointer.init(bitPattern: "buttonTextObject".hashValue)!) as? String) ?? ""
        let indicator = objc_getAssociatedObject(self, UnsafeRawPointer.init(bitPattern: "indicatorView".hashValue)!) as! UIActivityIndicatorView
        let image = objc_getAssociatedObject(self, UnsafeRawPointer.init(bitPattern: "buttonImageObject".hashValue)!) as? UIImage
        isEnabled = true
        indicator.removeFromSuperview()
        setTitle(currentButtonText , for: .normal)
        setImage(image, for: .normal)
    }
}
