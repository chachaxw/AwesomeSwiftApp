//
//  UIView+Border.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/26.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

extension UIView {
    @objc var borderColor: UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
            self.layer.borderWidth = 1
        }
        get {
            return .clear
        }
    }

    @objc var radius: CGFloat {
        set {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = newValue
        }
        get {
            return 0
        }
    }

    @objc var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return 0
        }
    }

    // Set round corners
    func roundCorners(corners: UIRectCorner, with radii: CGFloat) {
        let bezierPath: UIBezierPath = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radii, height: radii)
        )
        let shape: CAShapeLayer = CAShapeLayer()

        shape.frame = self.bounds
        shape.path = bezierPath.cgPath
        shape.fillColor = UIColor.white.cgColor
        shape.shadowOpacity = 0.1
        shape.shadowRadius = 5
        shape.shadowPath = bezierPath.cgPath
        shape.shadowColor = UIColor.black.cgColor
        shape.shadowOffset = CGSize(width: 0, height: -5)

        self.layer.mask = shape
    }
}
