//
//  RootRouter.swift
//  AwesomeSwiftApp
//
//  Copyright © Chacha. All rights reserved.
//

import UIKit

class RootRouter {

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
//        let textView = UITextView(frame: CGRect(20, 50, 200, 40)
//
//        textView.text = "Hello Chacha!"
//        textView.textColor = UIColor.white

        controller.view.backgroundColor = UIColor.init(red: 27/255.0, green: 95/255.0, blue: 191/255.0, alpha: 1)
//        controller.view.addSubview(textView)
        setRootViewController(controller: controller, animatedWithOptions: nil)
    }
}
