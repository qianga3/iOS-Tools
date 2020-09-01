//
//  Dispatch+Extension.swift
//  Hulk
//
//  Created by 1 on 19/6/2020.
//  Copyright © 2020 gzlh. All rights reserved.
//

import UIKit

extension DispatchQueue {
    
    func after(second: Double, execute work: @escaping @convention(block) () -> Void) {
        self.asyncAfter(deadline: .now() + second, execute: work)
    }
    
    func afterMain(second: Double, execute work: @escaping @convention(block) () -> Void) {
        self.after(second: second) {
            DispatchQueue.main.async(execute: work)
        }
    }
}
