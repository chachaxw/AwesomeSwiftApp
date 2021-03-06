//
//  HomeViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/3/4.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Hero
import SwiftDate
import SwiftTheme
import UIKit

class HomeViewController: UIViewController {
    private let cellIdentifier = "DemoCollectionCell"
    private let detailIdentifier = "DemoDetailStoryboard"
    private let header = MJRefreshNormalHeader()
    private let footer = MJRefreshAutoNormalFooter()

    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var navigationBar: UINavigationBar!
    @IBOutlet weak private var dateLabel: UILabel!

    var cardList: [DemoModel] = DemoMockData.list

    override func viewDidLoad() {
        super.viewDidLoad()

        // 下拉刷新
        header.stateLabel?.isHidden = true
        header.lastUpdatedTimeLabel?.isHidden = true
        header.setRefreshingTarget(self, refreshingAction: Selector(("headerRefresh")))
        collectionView.mj_header = header

        // 上拉加载
        footer.setRefreshingTarget(self, refreshingAction: Selector(("footerRefresh")))
        collectionView.mj_footer = footer

        dateLabel.text = Date().toFormat("EEE, d MMM")
        view.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.darkGrayColor]

        if #available(iOS 11, *) {
            navigationBar.prefersLargeTitles = true
            navigationBar.isTranslucent = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 下拉刷新
    func headerRefresh() {
        print("下拉刷新")
        // 结束刷新
        collectionView.mj_header?.endRefreshing()
    }

    // 上拉加载
    func footerRefresh() {
        print("上拉加载")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellIdentifier, for: indexPath) as? CollectionViewCell else {
                fatalError("DequeueReusableCell failed while casting")
        }

        let cardItem: DemoModel = cardList[indexPath.row]

        cell.setButton(isActive: cardItem.isLiked)
        cell.setLabelText(label: cardItem.label)
        cell.setTitleText(title: cardItem.title)
        cell.setCoverImage(image: cardItem.uiImage!)

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardList.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard (UIStoryboard.main?.instantiateViewController(
                withIdentifier: detailIdentifier) as? DemoDetailViewController) != nil else {
            return
        }

        print("当前indexPath \(indexPath.item)")
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        _ = collectionView.cellForItem(at: indexPath)
//        cell?.animate(shouldScale: true)
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        _ = collectionView.cellForItem(at: indexPath)
//        cell?.animate(shouldScale: false)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = UIScreen.main.bounds.width - 14 * 2
        return CGSize(width: width, height: 360)
    }
}
