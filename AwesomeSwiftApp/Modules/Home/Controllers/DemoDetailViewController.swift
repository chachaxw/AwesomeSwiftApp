//
//  DetailViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/20.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class DemoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func launchMiniProgram(_ sender: Any) {
        let launchMiniProgramReq = WXLaunchMiniProgramReq()
        launchMiniProgramReq.userName = "gh_82799a5c1f6a"

        WXApi.send(launchMiniProgramReq)
    }
}
