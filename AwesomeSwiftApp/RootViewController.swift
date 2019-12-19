//
//  LaunchScreenController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/15.
//  Copyright © 2019 Chacha. All rights reserved.
//

import Log
import UIKit

class RootViewController: UIViewController, CAAnimationDelegate {
    var maskView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Logo layer
        let logoLayer = CALayer()
        logoLayer.bounds = CGRect(x: 0, y: 0, width: 181, height: 35)
        logoLayer.position = view.center
        logoLayer.contents = R.image.chacha()?.cgImage
        view.layer.mask = logoLayer

        maskView = UIView(frame: view.frame)
        maskView.backgroundColor = UIColor.white
        view.addSubview(maskView)

        let appDelegate = UIApplication.shared.delegate
        let window = appDelegate?.window
        window??.backgroundColor = UIColor.Theme.PrimaryColor

        let logoAnimation = CAKeyframeAnimation(keyPath: "bounds")
        logoAnimation.beginTime = CACurrentMediaTime() + 1
        logoAnimation.duration = 1
        logoAnimation.keyTimes = [0, 0.4, 1]
        logoAnimation.values = [
            NSValue(cgRect: CGRect(x: 0, y: 0, width: 181, height: 35)),
            NSValue(cgRect: CGRect(x: 0, y: 0, width: 145, height: 28)),
            NSValue(cgRect: CGRect(x: 0, y: 0, width: 3602, height: 700))
        ]
        logoAnimation.timingFunctions = [
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        ]
        logoAnimation.fillMode = CAMediaTimingFillMode.forwards
        logoLayer.add(logoAnimation, forKey: "zoomAnimation")

        let logoOpacityAnimation = CABasicAnimation(keyPath: "opacity")
        logoOpacityAnimation.beginTime = CACurrentMediaTime() + 1
        logoOpacityAnimation.duration = 1
        logoOpacityAnimation.fromValue = 1
        logoOpacityAnimation.toValue = 0
        logoOpacityAnimation.delegate = self
        maskView.layer.add(logoOpacityAnimation, forKey: "opacityAnimation")
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
