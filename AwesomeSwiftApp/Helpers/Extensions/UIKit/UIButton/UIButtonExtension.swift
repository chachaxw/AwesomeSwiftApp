//
//  UIButton+Image.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/14.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

enum ButtonImagePosition: Int {
    case positionTop = 0
    case positionLeft
    case positionBottom
    case positionRight
}

@available(iOS 9.0, *)
extension UIButton {

    /// Set an image and title to a UIButton
    /// - Parameters:
    ///     - image: The image that will be added to the button
    ///     - title: The title that will be added to the button
    ///     - type: The image position type in button
    ///     - space: The edge insets in button
    func setImageAndTitle(image: UIImage, title: String, type: ButtonImagePosition, Space space: CGFloat) {
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)

        let imageWidth: CGFloat = self.imageView?.frame.width ?? 88
        let imageHeight: CGFloat = self.imageView?.frame.height ?? 88

        var labelWidth: CGFloat = 0.0
        var labelHeight: CGFloat = 0.0

        labelWidth = CGFloat(self.titleLabel?.intrinsicContentSize.width ?? 88)
        labelHeight = CGFloat(self.titleLabel?.intrinsicContentSize.height ?? 32)

        var imageEdgeInsets: UIEdgeInsets = UIEdgeInsets()
        var labelEdgeInsets: UIEdgeInsets = UIEdgeInsets()

        switch type {
        case .positionTop:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space / 2.0, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight - space / 2.0, right: 0)

        case .positionLeft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space / 2.0, bottom: 0, right: space / 2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -space / 2.0, bottom: 0, right: space / 2.0)

        case .positionBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight - space / 2.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight - space / 2.0, left: -imageWidth, bottom: 0, right: 0)

        case .positionRight:
            imageEdgeInsets = UIEdgeInsets(
                top: 0,
                left: labelWidth + space / 2.0,
                bottom: 0,
                right: -labelWidth - space / 2.0
            )
            labelEdgeInsets = UIEdgeInsets(
                top: 0,
                left: -imageWidth - space / 2.0,
                bottom: 0,
                right: imageWidth + space / 2.0
            )
        }

        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }

    /// Add a right image with custom offset to the button
    /// - Parameters:
    ///     - image: The image that will be added to the button.
    ///     - offset: The trailing margin that will be added between the image and the button's right border.
    func addRightImage(_ image: UIImage?, offset: CGFloat) {
        setImage(image, for: .normal)
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
        imageView?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset).isActive = true
    }

    func setGradient(startColor: UIColor, endColor: UIColor, frame: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.frame = frame
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.layer.addSublayer(gradientLayer)
    }
}
