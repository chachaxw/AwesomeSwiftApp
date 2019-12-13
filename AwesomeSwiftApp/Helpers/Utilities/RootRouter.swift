//
//  RootRouter.swift
//  AwesomeSwiftApp
//
//  Copyright © Chacha. All rights reserved.
//

import UIKit

class RootRouter {
    let backgroundColor: UIColor = UIColor(red: 248 / 255.0, green: 248 / 255.0, blue: 248 / 255.0, alpha: 1)

    /** Replaces root view controller. You can specify the replacment animation type.
     If no animation type is specified, there is no animation */
    func setRootViewController(controller: UIViewController, animatedWithOptions: UIView.AnimationOptions?) {
        guard let window = UIApplication.shared.keyWindow else {
            fatalError("No window in app")
        }
        if let animationOptions = animatedWithOptions, window.rootViewController != nil {
            window.rootViewController = controller
            UIView.transition(with: window, duration: 0.33, options: animationOptions, animations: {
            }, completion: nil)
        } else {
            window.rootViewController = controller
        }
    }

    func loadMainAppStructure() {
        // Customize your app structure here
        let controller = UIViewController()
        controller.view.backgroundColor = self.backgroundColor
        setRootViewController(controller: controller, animatedWithOptions: nil)
    }
}
