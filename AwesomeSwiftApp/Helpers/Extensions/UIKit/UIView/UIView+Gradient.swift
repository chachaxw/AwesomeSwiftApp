//
//  UIView+Gradient.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/1/6.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

extension UIView {
    func setGradientBackgroundColor(startColor: UIColor, endColor: UIColor, frame: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.frame = frame
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
