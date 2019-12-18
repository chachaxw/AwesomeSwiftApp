//
//  HomeViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/17.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var homeView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        print("首页", homeView ?? "Hello World")
    }
}
