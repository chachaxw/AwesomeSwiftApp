//
//  UIViewExtension.swift
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

    /// Set round corners
    /// - Parameters:
    ///     - corners: The round corners
    ///     - radii: The number of corner radii
    func setRoundCorners(corners: UIRectCorner, with radii: CGFloat) {
        let cornersLayer: CAShapeLayer = CAShapeLayer()
        let bezierPath: UIBezierPath = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radii, height: radii)
        )

        cornersLayer.frame = self.bounds
        cornersLayer.path = bezierPath.cgPath
        self.layer.addSublayer(cornersLayer)
    }

    /// Set gradient color round corners
    /// - Parameters:
    ///     - corners: The round corners
    ///     - radii: The number of corner radii
    ///     - startColor: The start color of gradient
    ///     - endColor: The ent color of gradient
    func setGradientCorners(corners: UIRectCorner, with radii: CGFloat, startColor: UIColor, endColor: UIColor) {
        let cornersLayer: CAShapeLayer = CAShapeLayer()
        let bezierPath: UIBezierPath = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radii, height: radii)
        )

        cornersLayer.frame = self.bounds
        cornersLayer.cornerRadius = radii
        cornersLayer.path = bezierPath.cgPath

        let gradientLayer = CAGradientLayer()

        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.cornerRadius = radii
        gradientLayer.mask = cornersLayer

        self.layer.cornerRadius = radii
        self.layer.addSublayer(gradientLayer)
    }

    // Set view shadow style
    func setShadow(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius)

        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowPath = shadowPath.cgPath
    }
}

// MARK: - Corner Radius
extension UIView {

    /// Apply a corner radius to the view.
    /// - Parameter radius: The radius that will be applied to the view.
    /// - Parameter maskedCorners: The corners on which the radius will be applied. Default value is all corners.
    @available(iOS 11.0, tvOS 11.0, *)
    public func applyCornerRadius(
        _ radius: CGFloat,
        maskedCorners: CACornerMask = [
            .layerMaxXMaxYCorner,
            .layerMaxXMinYCorner,
            .layerMinXMaxYCorner,
            .layerMinXMinYCorner
        ]
    ) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = maskedCorners
        self.layer.masksToBounds = true
    }
}