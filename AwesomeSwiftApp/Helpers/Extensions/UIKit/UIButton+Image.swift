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

extension UIButton {

    func setImageAndTitle(image: UIImage, title: String, type: ButtonImagePosition, Space space: CGFloat) {
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)

        let imageWidth: CGFloat = (self.imageView?.frame.width)!
        let imageHeight: CGFloat = (self.imageView?.frame.height)!

        var labelWidth: CGFloat = 0.0
        var labelHeight: CGFloat = 0.0

        labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width)
        labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height)

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
}
