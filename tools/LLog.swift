//
//  Log.swift
//  SwiftTest
//
//  Created by 1 on 26/5/2020.
//  Copyright © 2020 gzlh. All rights reserved.
//

import UIKit

func llog<T>(_ message:T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent;
    print("\(fileName) \(line)L \(method):\(message)")
    #endif
}
