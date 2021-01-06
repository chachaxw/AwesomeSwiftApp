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
    private let demoDetailIdentifier = "DemoDetailStoryboard"

    @IBOutlet weak private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.darkGrayColor]
        view.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.darkGrayColor]
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
        guard let detailViewCtrl = R.storyboard.main().instantiateViewController(
                withIdentifier: demoDetailIdentifier) as? DemoDetailViewController else {
            return
        }

        self.navigationController?.pushViewController(detailViewCtrl, animated: true)
    }

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.theme_backgroundColor = [AppColors.secondaryGrayColor, AppColors.deepBlackColor]
    }

    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.theme_backgroundColor = [AppColors.whiteColor, AppColors.blackColor]
    }
}
