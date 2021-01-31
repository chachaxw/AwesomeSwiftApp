//
//  UIScrollViewExtension.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2021/1/27.
//  Copyright © 2021 Chacha. All rights reserved.
//

import ObjectiveC.runtime
import ParallaxHeader
import UIKit

/**
 A UIScrollView extension with a ParallaxHeader.
 */
extension UIScrollView {

    private struct AssociatedKeys {
        static var descriptiveName = "AssociatedKeys.DescriptiveName.parallaxHeader"
    }

    public var parallaxHeaderView: ParallaxHeader {
        get {
            if let header = objc_getAssociatedObject(
                self,
                &AssociatedKeys.descriptiveName
            ) as? ParallaxHeader {
                return header
            }

            let header = ParallaxHeader()
            self.parallaxHeaderView = header
            return header
        }

        set(parallaxHeader) {
            parallaxHeader.view = self

            objc_setAssociatedObject(
                self,
                &AssociatedKeys.descriptiveName,
                parallaxHeaderView,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}