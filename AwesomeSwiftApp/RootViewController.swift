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
    let homeViewCtrl = HomeViewController()
    let featuredViewCtrl = FeaturedViewController()
    let userViewCtrl = UserViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor.Theme.SecondaryColor
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UIColor.white
        tabBar.layer.cornerRadius = 20

        if #available(iOS 11.0, *) {
            tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }

        homeViewCtrl.tabBarItem.title = "Discover"
        if #available(iOS 13.0, *) {
            homeViewCtrl.tabBarItem.image = UIImage(systemName: "safari")
            homeViewCtrl.tabBarItem.selectedImage = UIImage(systemName: "safari.fill")
        } else {
            // Fallback on earlier versions
        }

        featuredViewCtrl.tabBarItem = featuredTabItem
        featuredViewCtrl.tabBarItem.title = "Featured"
        if #available(iOS 13.0, *) {
            featuredViewCtrl.tabBarItem.image = UIImage(systemName: "star")
            featuredViewCtrl.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        } else {
            // Fallback on earlier versions
        }

        userViewCtrl.tabBarItem = meTabItem
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
        self.animiation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("TabBar", tabBar, item)
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
