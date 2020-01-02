//
//  HomeViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/17.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        self.init(nib: R.nib.homeViewContoller)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
