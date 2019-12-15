//
//  LaunchScreenController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/15.
//  Copyright © 2019 Chacha. All rights reserved.
//

import Log
import UIKit

class LaunchScreenViewController: UIViewController, CAAnimationDelegate {
    var maskView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Background image view
        let bgImageView = UIImageView(image: R.image.launchImage())
        bgImageView.frame = self.view.frame
        self.view.addSubview(bgImageView)

        // Logo layer
        let logoLayer = CALayer()
        logoLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        logoLayer.position = view.center
        logoLayer.contents = R.image.glyphLogo()
        view.layer.mask = logoLayer

        print("View", view as Any, "Self View", self.view ?? "Self view is nil")

        maskView = UIView(frame: view.frame)
        maskView.backgroundColor = UIColor.white
        view.addSubview(maskView)

        let appDelegate = UIApplication.shared.delegate
        let window = appDelegate?.window
        window??.backgroundColor = UIColor.Theme.PrimaryColor

        let logoAnimation = CAKeyframeAnimation(keyPath: "bounds")
        logoAnimation.beginTime = CACurrentMediaTime() + 1
        logoAnimation.keyTimes = [0, 0.4, 1]
        logoAnimation.values = [
            NSValue(cgRect: CGRect(x: 0, y: 0, width: 100, height: 100)),
            NSValue(cgRect: CGRect(x: 0, y: 0, width: 85, height: 85)),
            NSValue(cgRect: CGRect(x: 0, y: 0, width: 4500, height: 4500))
        ]
        logoAnimation.timingFunctions = [
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        ]
        logoAnimation.fillMode = CAMediaTimingFillMode.forwards
        logoLayer.add(logoAnimation, forKey: "opacityAnimation")
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.maskView.removeFromSuperview()
        super.view.layer.mask = nil
    }
}
