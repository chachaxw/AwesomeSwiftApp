//
//  RootViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/20.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController, CAAnimationDelegate {

    var homeTabItem: UITabBarItem!
    var featuredTabItem: UITabBarItem!
    var meTabItem: UITabBarItem!
    var maskView: UIView!
    var currentTabIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.animiation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let tabIndex = tabBar.items?.firstIndex(of: item)

        if tabIndex != currentTabIndex {
            currentTabIndex = tabIndex ?? 0

            let imageView = tabBar.subviews[currentTabIndex + 1]
            playBounceAnimation(imageView, 1)
        }
    }

    func setTabBar() {
        tabBar.tintColor = UIColor.Theme.PrimaryColor
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UIColor.white

        if #available(iOS 13, *) {
            let appearance = tabBar.standardAppearance.copy()
//            appearance.backgroundImage = UIImage(color: UIColor.clear)
//            appearance.shadowImage = UIImage(color: UIColor.clear)
            tabBar.standardAppearance = appearance
        } else {
//            tabBar.shadowImage = UIImage(color: UIColor.clear)
//            tabBar.backgroundImage = UIImage(color: UIColor.clear)
        }
    }

    func playBounceAnimation(_ view: UIView, _ repeatCount: Float) {
        let bounce = CAKeyframeAnimation(keyPath: "transform.scale")
        bounce.values = [1.0, 1.15, 1.0]
        bounce.duration = TimeInterval(0.3)
        bounce.repeatCount = repeatCount
        bounce.calculationMode = CAAnimationCalculationMode.cubic
        view.layer.add(bounce, forKey: nil)
    }

    func animiation() {
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
