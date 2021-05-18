//
//  GradientView.swift
//  demo Sentinel App v0.0.1
//
//  Created by NEM on 22/04/2021.
//

import UIKit
class GradientView: UIView {
    var topColor : UIColor = #colorLiteral(red: 0, green: 0.1254901961, blue: 0.3411764706, alpha: 1)
    var bottomColor : UIColor = #colorLiteral(red: 0, green: 0.2352941176, blue: 0.6352941176, alpha: 1)
    
    var startPointX: CGFloat = 0
    var startPointY: CGFloat = 0
    
    var endpointX: CGFloat = 1
    var endpointY: CGFloat = 1
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x: endpointX, y: endpointY)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
