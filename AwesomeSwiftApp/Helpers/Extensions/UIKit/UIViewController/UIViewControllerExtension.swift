//
//  UIViewControllerExtension.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/13.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

#if canImport(SwiftUI)
import SwiftUI
#endif

// MARK: - Navigation

extension UIViewController {
    
    /// Remove all the previous controllers from the navigation
    /// - Parameter animated: If false, replace the view controllers without any animations,
    ///                       otherwise it will be animated.
    public func removePreviousControllers(animated: Bool = false) {
        navigationController?.setViewControllers([self], animated: animated)
    }
}

// MARK: - Misc

extension UIViewController {
    
    /// Either the viewcontroller is visible or not.
    public var isVisible: Bool {
        self.isViewLoaded && view.window != nil
    }
    
    /// Check if the view controller has been presented or not.
    /// - Returns: true if the controller is presented, otherwise false.
    public var isModal: Bool {
        presentingViewController?.presentedViewController == self ||
            navigationController?.presentingViewController?.presentedViewController == navigationController ||
            tabBarController?.presentingViewController is UITabBarController
    }
}

// MARK: - ChildVC

extension UIViewController {
    
}
