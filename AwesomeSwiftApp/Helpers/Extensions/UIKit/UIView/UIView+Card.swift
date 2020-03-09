//
//  UIView+Card.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/3/8.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

@IBDesignable
class UICardView: UIView {

    @IBInspectable var cornorRadius: CGFloat = 10.0
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 2
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.08

    override func layoutSubviews() {
        layer.cornerRadius = cornorRadius

        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornorRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
}
