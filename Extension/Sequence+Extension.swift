//
//  SequenceExtension.swift
//  Hulk
//
//  Created by mac on 2020/6/18.
//  Copyright © 2020 gzlh. All rights reserved.
//

import Foundation
extension Sequence where Iterator.Element: Equatable  {
    
    mutating func remove(item: Iterator.Element) {
        self = self.filter{$0 != item} as? Self ?? self
    }
    
    mutating func remove(items:[Iterator.Element]) {
        self = self.filter{!items.contains($0)} as? Self ?? self
    }
    
}
