//
//  Int+Ext+Sum.swift
//  new sentinal
//
//  Created by NEM on 20/05/2021.
//

import Foundation
extension Int {
    func sum() -> Int {
        return self { $0 as Int }.reduce(0) { $0 + $1 }
    }
}
