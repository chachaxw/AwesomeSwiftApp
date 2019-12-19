//
//  HomeViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/17.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tabBar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("首页", "Hello World")
    }
}
