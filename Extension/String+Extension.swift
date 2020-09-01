//
//  StringExtension.swift
//  Hulk
//
//  Created by mac on 2020/6/17.
//  Copyright © 2020 gzlh. All rights reserved.
//

import UIKit

extension String {
    func lengthOfBytesInChinise() -> Int{
        var length = 0
        for char in self {
            length += "\(char)".lengthOfBytes(using: String.Encoding.utf8) == 3 ? 2:1
        }
        return length
    }
    
    /// 根据字符获取宽度
    func width(_ font: UIFont, maxHeight: CGFloat, maxWidth: CGFloat = ScreenWith) -> CGFloat {
        let tempStr = self as NSString
        return tempStr.boundingRect(with: CGSize.init(width: maxWidth, height: maxHeight), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).size.width
    }
    
    /// 根据字符获取高度
    func height(_ font: UIFont, maxWith: CGFloat) -> CGFloat {
        let tempStr = self as NSString
        return tempStr.boundingRect(with: CGSize.init(width: maxWith, height: 10000), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).size.height
    }
    
    ///移动手机号判断
    func validateMobile()-> Bool {
        
        // 手机号以 13 14 15 18 开头   八个 \d 数字字符
        
        let phoneRegex = "^((13[0-9])|(17[0-9])|(14[^4,\\D])|(15[^4,\\D])|(18[0-9]))\\d{8}$|^1(7[0-9])\\d{8}$"
        
        let phoneTest = NSPredicate(format: "SELF MATCHES %@" , phoneRegex)
        
        return (phoneTest.evaluate(with: self));
    }
    
    // MARK: 字符串的range
    func rangeOf(_ subStr: String) -> NSRange? {
        guard let range = range(of: subStr) else {
            return nil
        }
        return NSRange(range, in: self)
    }
    
    //图片资源中文字转换
    func changeStrToURL() -> URL? {
        return URL(string: (self as NSString).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
    
    func changeEncoding() -> String {
        return (self as NSString).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    public func substring(from index: Int) -> String {
        if self.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[startIndex..<self.endIndex]
            
            return String(subString)
        } else {
            return self
        }
    }
    
    public func substring(to index: Int) -> String {
        if self.count > index {
            let endIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[self.startIndex..<endIndex]
            
            return String(subString)
        } else {
            return self
        }
    }
    
    public func substring(from index: Int, length: Int) -> String {
        
        return self.substring(from: index).substring(to: length)
    }
    
    func toDate(formatterString: String = "yyyy-MM-dd") -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = formatterString
        formatter.locale = Locale(identifier: "zh")
        return formatter.date(from: self) ?? Date()
    }

}


extension TimeInterval {
    func changeTimeLeast() -> String {
        let current = Date().timeIntervalSince1970 * 1000
        let reduceTime = (current - self)/1000
        let min = Int(reduceTime / 60)
        if  min <= 60 {
            if min == 0 {
                return "刚刚"
            }
            return "\(min)分钟前"
        }
        
        let hour = Int(reduceTime / 3600)
        if hour < 24 {
            return "\(hour)小时前"
        }
        return Date.init(timeIntervalSince1970: self/1000).toString(formatterString: "yyyy-MM-dd")
        
    }
    
    ///时间戳转换成时间
    func changteStampToTime() -> String {
        let timeInterVal = TimeInterval.init(self/1000)
        let tempDate = Date.init(timeIntervalSince1970: timeInterVal)
        let dfromatter = DateFormatter()
        dfromatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dfromatter.string(from: tempDate)
    }
    
    ///时间戳转换成时间
    func changteStampToTime(format: String) -> String {
         let timeInterVal = TimeInterval.init(self/1000)
         let tempDate = Date.init(timeIntervalSince1970: timeInterVal)
         let dfromatter = DateFormatter()
         dfromatter.dateFormat = format
         return dfromatter.string(from: tempDate)
     }
    
    func changtesStampToTime() -> String {
        let timeInterVal = TimeInterval.init(self/1000)
        let tempDate = Date.init(timeIntervalSince1970: timeInterVal)
        let dfromatter = DateFormatter()
        dfromatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dfromatter.string(from: tempDate)
    }
}

extension String {
    func ext2Range(_ range: NSRange) -> Range<String.Index>? {
        guard let from16 = utf16.index(utf16.startIndex, offsetBy: range.location, limitedBy: utf16.endIndex) else { return nil }
        guard let to16 = utf16.index(from16, offsetBy: range.length, limitedBy: utf16.endIndex) else { return nil }
        guard let from = String.Index(from16, within: self) else { return nil }
        guard let to = String.Index(to16, within: self) else { return nil }
        return from ..< to
    }
    
    func validateNumber(_ textField: UITextField, range: NSRange, string: String, limit: Int = 11) -> Bool {
        
        guard let text = textField.text else { return false }

        ///拼接了参数string的afterStr
        let afterStr = text.replacingCharacters(in: text.ext2Range(range)!, with: string)
     
        ///限制长度
        if afterStr.count > limit {
            textField.text = (afterStr as NSString).substring(to: limit)
            return false
        }
        
        ///是否都是数字
        let set = CharacterSet(charactersIn: "0123456789").inverted
        let filteredStr = string.components(separatedBy: set).joined(separator: "")
        
        if filteredStr == string {
            return true
        }
        
        return false
    }
    
    /// 校验数字和字母
    func predicateNumberAndLetterMethod(_ identityCard: String) -> Bool {
        let reg = "^[a-zA-Z0-9]{0,18}"
        let pre = NSPredicate(format: "SELF MATCHES %@", reg)
        if pre.evaluate(with: identityCard) {
            return true
        } else {
           return false
        }
    }
    
    /// 处理手机号码格式，eg: 137****9999
    static func encryptionPhoneNumber(phone:String?) -> String {
        
        guard phone != nil else {
            return ""
        }
        
        guard phone!.count == 11 else {
            return phone!
        }
        
        let encrpPhone = phone!.substring(from: 0, length: 3) + "****" + phone!.substring(from: 7)
        
        return encrpPhone
    }
}

extension String {
    
    /// NSNumber 转 String
    static func numberToString(number:NSNumber) -> String {
        let formattor = NumberFormatter()
        formattor.numberStyle = .decimal
        let string = formattor.string(from: number) ?? ""
        return string.replacingOccurrences(of: ",", with: "")
    }
    
    /// Double 转 String
    static func doubleToString(double:Double) -> String {
        let formattor = NumberFormatter()
        formattor.numberStyle = .decimal
        let string = formattor.string(from: NSNumber(value: double)) ?? ""
        return string.replacingOccurrences(of: ",", with: "")
    }
}

extension String {
    
    /// 答题卡：从以秒计时的时间里获得表示时间的字符串用于显示
    static func questionTimeStringFromSecond(seconds: Int) -> String {
        
        let secondNumber = seconds % 60
        let minuteNumber = (seconds / 60)
        let secondText = secondNumber < 10 ? "0\(secondNumber)" : "\(secondNumber)"
        let minuteText = minuteNumber < 10 ? "0\(minuteNumber)" : "\(minuteNumber)"
        return "\(minuteText):\(secondText)"
    }
}
