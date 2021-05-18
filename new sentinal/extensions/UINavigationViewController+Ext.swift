//
//  UINavigationViewController+Ext.swift
//  new sentinal
//
//  Created by NEM on 27/04/2021.
//

import UIKit

extension UINavigationController {
    
    var mainStoryBoard: UIStoryboard {
        get {
            return UIStoryboard(name: "Main", bundle: nil)
        }
    }
}
