//
//  UserViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/27.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    private let cellIdentifier = "ReportCollectionCell"

    @IBOutlet weak private var coverImageView: UIImageView!
    @IBOutlet weak private var userProfileView: UIView!
    @IBOutlet weak private var avatarView: UIImageView!
    @IBOutlet weak private var usernameView: UILabel!
    @IBOutlet weak private var settingButton: UIButton!
    @IBOutlet weak private var collectionView: UICollectionView!

    var cardList: [ReportItemModel] = ReportMockData.list

    override func viewDidLoad() {
        super.viewDidLoad()

        view.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.darkGrayColor]

        // Do any additional setup after loading the view.
        initProfileView()
        initSettingButton()
        initCollectionView()
    }

    func initProfileView() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)

        blurView.frame = self.userProfileView.bounds

        userProfileView.insertSubview(blurView, at: 0)
        userProfileView.layer.backgroundColor = UIColor.clear.cgColor
        userProfileView.layer.cornerRadius = 12
        userProfileView.layer.masksToBounds = true
    }

    func initSettingButton() {
        let icon = UIImage.fontAwesomeIcon(
            name: .cog,
            style: .solid,
            textColor: UIColor.Theme.BasicGrayColor,
            size: CGSize(width: 24, height: 24)
        )

        settingButton.layer.cornerRadius = 10
        settingButton.setImage(icon, for: .normal)
        settingButton.setShadow(
            color: UIColor.Theme.LightShadowColor,
            offset: CGSize(width: 0, height: 3),
            opacity: 0.8,
            radius: 8
        )
    }

    func initCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 16
        collectionView.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.darkGrayColor]
//        collectionView.parallaxHeader.view = coverImageView
//        collectionView.parallaxHeader.height = coverImageView.frame.height
    }
}

extension UserViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardList.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellIdentifier,
            for: indexPath
        ) as? ReportCollectionViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }

        let reportItem: ReportItemModel = cardList[indexPath.row]

        cell.setLabel(num: String(reportItem.num), title: reportItem.title)

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.contentView.theme_backgroundColor = [AppColors.secondaryGrayColor, AppColors.deepBlackColor]
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.contentView.theme_backgroundColor = [AppColors.whiteColor, AppColors.blackColor]
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = floor(Double(UIScreen.width - 4 * 14) / 3)
        print("cell 大小 \(width)")
        return CGSize(width: width, height: width)
    }
}
