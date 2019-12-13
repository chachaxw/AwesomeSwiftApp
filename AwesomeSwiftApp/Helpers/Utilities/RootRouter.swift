//
//  RootRouter.swift
//  AwesomeSwiftApp
//
//  Copyright © Chacha. All rights reserved.
//

import FontAwesome
import UIKit

class RootRouter {
    let appleIcon = UIImage.fontAwesomeIcon(
        name: .apple,
        style: .brands,
        textColor: UIColor.Theme.PrimaryColor,
        size: CGSize(width: 120, height: 120)
    )

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
        let imageView = UIImageView(image: appleIcon)

        controller.view.backgroundColor = UIColor.Theme.LightGrayColor
        controller.view.addSubview(imageView)
        setRootViewController(controller: controller, animatedWithOptions: nil)
    }
}
