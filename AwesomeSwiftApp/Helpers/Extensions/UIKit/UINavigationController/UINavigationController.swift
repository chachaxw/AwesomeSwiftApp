//
//  UINavigationController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2021/1/29.
//  Copyright © 2021 Chacha. All rights reserved.
//

import UIKit

// MARK: - NavigationBar style

// 枚举
enum NavigationBarStyle {
    case theme
    case clear
    case white
}

extension UINavigationController {

    private struct AssociatedKeys {
        static var disablePopGesture: Void?
    }

    var disablePopGesture: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.disablePopGesture) as? Bool ?? false
        }

        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.disablePopGesture,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    func barStyle(_ style: NavigationBarStyle) {
        switch style {
        case .clear:
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        case .white:
            navigationBar.barStyle = .default
            navigationBar.setBackgroundImage(UIColor.white.image(), for: .default)
            navigationBar.shadowImage = UIImage()
        case .theme:
            navigationBar.barStyle = .black
            navigationBar.shadowImage = UIImage()
        }
    }
}
