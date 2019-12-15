//
//  LaunchScreenController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/15.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController, CAAnimationDelegate {
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
    }
}
