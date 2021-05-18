//
//  File.swift
//  new sentinal
//
//  Created by NEM on 06/05/2021.
//

import UIKit

extension UIViewController {
    func Alert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
