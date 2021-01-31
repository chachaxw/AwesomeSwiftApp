//
//  UIViewExtension.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/26.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

extension UIView {
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
        self.layer.mask = cornersLayer
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

        layer.cornerRadius = radii
        layer.addSublayer(gradientLayer)
    }

    // Set view shadow style
    func setShadow(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        layer.masksToBounds = false

        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius)

        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowPath = shadowPath.cgPath

        let backgroundCGColor = backgroundColor?.cgColor

        backgroundColor = nil
        layer.backgroundColor = backgroundCGColor
    }
    
    // Set gradient backgrounnd color
    func setGradientBackgroundColor(startColor: UIColor, endColor: UIColor, frame: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.frame = frame
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.layer.insertSublayer(gradientLayer, at: 0)
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
        layer.cornerRadius = radius
        layer.maskedCorners = maskedCorners
        layer.masksToBounds = true
    }
    
    private struct AssociatedKeys {
        static var descriptiveName = "AssociatedKeys.DescripttiveName.gradientMaskView"
    }
    
    private var gradientMaskView: GradientMaskView {
        get {
            if let maskView = objc_getAssociatedObject(self, &AssociatedKeys.descriptiveName) as? GradientMaskView {
                return maskView
            }

            self.gradientMaskView = GradientMaskView(to: self)
            return self.gradientMaskView
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.descriptiveName, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    class GradientMaskView {
        private var maskView: UIView?
        
        init(to view: UIView) {
            self.maskView = view
        }
        
        func enable(isHidden: Bool = false) {
            if maskView == nil {
                applyGradientMask()
            }

            self.maskView?.isHidden = isHidden
        }

        func applyGradientMask() {
            let layer = CAGradientLayer()
            layer.colors = [
                UIColor(netHex: 0x000000, alpha: 0.5).cgColor,
                UIColor(netHex: 0xffffff, alpha: 0).cgColor,
                UIColor(netHex: 0x000000, alpha: 0.5).cgColor
            ]
            layer.frame = maskView?.bounds ?? CGRect()
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
            maskView?.layer.addSublayer(layer)
        }
        
        private func addAlignedConstraints() {
//            translatesAutoresizingMaskIntoConstraints = false
            addAlignConstraintToSuperview(attribute: NSLayoutConstraint.Attribute.top)
            addAlignConstraintToSuperview(attribute: NSLayoutConstraint.Attribute.leading)
            addAlignConstraintToSuperview(attribute: NSLayoutConstraint.Attribute.bottom)
            addAlignConstraintToSuperview(attribute: NSLayoutConstraint.Attribute.trailing)
        }

        private func addAlignConstraintToSuperview(attribute: NSLayoutConstraint.Attribute) {
            maskView?.addConstraint(
                NSLayoutConstraint(
                    item: self,
                    attribute: attribute,
                    relatedBy: NSLayoutConstraint.Relation.equal,
                    toItem: maskView,
                    attribute: attribute,
                    multiplier: 1,
                    constant: 0
                )
            )
        }
    }
}
