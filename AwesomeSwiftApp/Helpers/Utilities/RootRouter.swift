//
//  RootRouter.swift
//  AwesomeSwiftApp
//
//  Copyright © Chacha. All rights reserved.
//

import SwiftUI
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
        var root: UIViewController

        if #available(iOS 13.0, *) {
            root = UIHostingController(rootView: ContentView(
                emails: GMenuData.emails,
                menuItems: GMenuData.Constants.menuItems
            ))
        } else {
            // Fallback on earlier versions
            root = RootViewController()
        }

        root.view.backgroundColor = UIColor.white
        setRootViewController(controller: root, animatedWithOptions: nil)
    }
}
