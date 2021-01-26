//
//  DetailViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/20.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class DemoDetailViewController: UIViewController {

    @IBOutlet weak private var overlayView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        initOverlayView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    func initOverlayView() {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor(netHex: 0x000000, alpha: 0.5).cgColor,
            UIColor(netHex: 0xffffff, alpha: 0).cgColor,
            UIColor(netHex: 0x000000, alpha: 0.5).cgColor
        ]
        layer.frame = overlayView.bounds
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 0, y: 1)
        overlayView.layer.insertSublayer(layer, at: 0)
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
