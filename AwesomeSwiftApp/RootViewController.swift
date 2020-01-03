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

    let homeViewCtrl = HomeViewController()
    let featuredViewCtrl = FeaturedViewController()
    let userViewCtrl = UserViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        homeViewCtrl.tabBarItem.title = "Discover"
        if #available(iOS 13.0, *) {
            homeViewCtrl.tabBarItem.image = UIImage(systemName: "safari")
            homeViewCtrl.tabBarItem.selectedImage = UIImage(systemName: "safari.fill")
        } else {
            // Fallback on earlier versions
        }

        featuredViewCtrl.tabBarItem.title = "Featured"
        if #available(iOS 13.0, *) {
            featuredViewCtrl.tabBarItem.image = UIImage(systemName: "star")
            featuredViewCtrl.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        } else {
            // Fallback on earlier versions
        }

        userViewCtrl.tabBarItem.title = "Me"
        if #available(iOS 13.0, *) {
            userViewCtrl.tabBarItem.image = UIImage(systemName: "person")
            userViewCtrl.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        } else {
            // Fallback on earlier versions
        }

        self.viewControllers = [
            homeViewCtrl,
            featuredViewCtrl,
            userViewCtrl
        ]
        self.setTabBar()
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
        tabBar.tintColor = UIColor.Theme.SecondaryColor
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UIColor.white
        tabBar.roundCorners(corners: [.topLeft, .topRight], with: 32)
    }

    func playBounceAnimation(_ view: UIView, _ repeatCount: Float) {
        let bounce = CAKeyframeAnimation(keyPath: "transform.scale")
        bounce.values = [1.0, 1.2, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounce.duration = TimeInterval(0.5)
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
