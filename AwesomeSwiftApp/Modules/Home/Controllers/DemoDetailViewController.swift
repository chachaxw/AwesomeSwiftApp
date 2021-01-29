//
//  DetailViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/20.
//  Copyright © 2020 Chacha. All rights reserved.
//

import ParallaxHeader
import SnapKit
import UIKit

class DemoDetailViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var coverImage: UIImageView!
    private var navHeight: CGFloat {
        return navigationController?.navigationBar.layer.frame.height ?? 44
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        navigationController?.barStyle(.clear)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    func initTableView() {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor(netHex: 0x000000, alpha: 0.5).cgColor,
            UIColor(netHex: 0xffffff, alpha: 0).cgColor,
            UIColor(netHex: 0x000000, alpha: 0.5).cgColor
        ]
        layer.frame = coverImage.bounds
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 0, y: 1)
        coverImage.layer.addSublayer(layer)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.parallaxHeader.view = coverImage
        tableView.parallaxHeader.height = 400
        tableView.parallaxHeader.minimumHeight = 0
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(-(UIScreen.statusBarHeight + navHeight))
        }
        tableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
            print(parallaxHeader.progress)

            if parallaxHeader.progress <= 0.5 {
                self.navigationController?.navigationBar.tintColor = .black
            } else {
                self.navigationController?.navigationBar.tintColor = .white
            }

            if parallaxHeader.progress <= 1.0 {
                self.navigationController?.navigationBar.setBackgroundImage(
                    UIColor(netHex: 0xffffff, alpha: 1).image(),
                    for: .default
                )
            }
        }
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

extension DemoDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.text = "some row text"

        return cell
    }
}
