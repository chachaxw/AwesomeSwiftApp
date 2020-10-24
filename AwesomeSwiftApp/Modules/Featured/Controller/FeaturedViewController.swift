//
//  FeaturedViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/28.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController {
    var tableData: [DemoModel] = DemoMockData.list
    private let cellIdentifier = "FeaturedTableCell"

    @IBOutlet weak private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.deepBlackColor]
        self.view.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.deepBlackColor]
    }
}

extension FeaturedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: cellIdentifier, for: indexPath) as? FeaturedTableViewCell else {
                fatalError("DequeueReusableCell failed while casting")
        }

        let demoData: DemoModel = tableData[indexPath.row]

        cell.setTitleText(title: demoData.title)
        cell.setDescText(desc: demoData.description)
        cell.setCoverImage(image: demoData.uiImage!)

        return cell
    }
}

extension FeaturedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击cell \(indexPath)")
        let detailViewCtrl = DemoDetailViewController()
        self.navigationController?.pushViewController(detailViewCtrl, animated: true)
    }

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.theme_backgroundColor = [AppColors.darkGrayColor, AppColors.lightGrayColor]
    }

    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = UIColor.white
    }
}
