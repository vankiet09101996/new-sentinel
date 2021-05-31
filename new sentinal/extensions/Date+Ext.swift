//
//  Date+Ext.swift
//  new sentinal
//
//  Created by NEM on 19/05/2021.
//

import Foundation
extension Date {
    func convertToString(format:String = "E, MMM d h:mm a") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        print(self)
        return dateFormatter.string(from: self)
    }
}
