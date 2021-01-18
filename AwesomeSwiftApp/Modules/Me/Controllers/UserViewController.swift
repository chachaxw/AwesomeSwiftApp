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

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet weak private var coverImageView: UIImageView!
    @IBOutlet weak private var userProfileView: UIView!
    @IBOutlet weak private var avatarView: UIImageView!
    @IBOutlet weak private var usernameView: UILabel!
    @IBOutlet weak private var settingButton: UIButton!
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var collectionView: UICollectionView!

    var cardList: [ReportItemModel] = ReportMockData.list

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView.delegate = self
        self.scrollView.alwaysBounceVertical = true
        self.view.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.darkGrayColor]
        self.contentView.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.darkGrayColor]
        self.contentView.layer.cornerRadius = 16

        // Do any additional setup after loading the view.
        initProfileView()
        initSettingButton()
        initCollectionView()
    }

    func initProfileView() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)

        blurView.frame = self.userProfileView.bounds

        self.userProfileView.insertSubview(blurView, at: 0)
        self.userProfileView.layer.backgroundColor = UIColor.clear.cgColor
        self.userProfileView.layer.cornerRadius = 12
        self.userProfileView.layer.masksToBounds = true
    }

    func initSettingButton() {
        let icon = UIImage.fontAwesomeIcon(
            name: .cog,
            style: .solid,
            textColor: UIColor.Theme.BasicGrayColor,
            size: CGSize(width: 24, height: 24)
        )

        settingButton.radius = 10.0
        settingButton.setImage(icon, for: .normal)
        settingButton.setShadow(
            color: UIColor.Theme.LightShadowColor,
            offset: CGSize(width: 0, height: 3),
            opacity: 0.8,
            radius: 8
        )
    }

    func initCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.clear
    }
}

extension UserViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y

        print("滑动偏移\(contentOffsetY)")

        if contentOffsetY < 0 {
            let imageHeight = coverImageView.frame.height - contentOffsetY
            coverImageView.frame = CGRect(x: 0, y: 0, width: coverImageView.frame.width, height: imageHeight)
            print("图片高度\(imageHeight)")
        }
    }
}

extension UserViewController: UICollectionViewDataSource {
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
}

extension UserViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int
//    ) -> UIEdgeInsets {
//
//    }
}

extension UserViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.contentView.theme_backgroundColor = [AppColors.secondaryGrayColor, AppColors.deepBlackColor]
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.contentView.theme_backgroundColor = [AppColors.whiteColor, AppColors.blackColor]
    }
}
