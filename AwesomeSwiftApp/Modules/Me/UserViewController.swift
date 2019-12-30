//
//  UserViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/24.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak private var headerImage: UIImageView!
    @IBOutlet weak private var wrapperView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        wrapperView.roundCorners(corners: [.topLeft, .topRight], with: 32)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
