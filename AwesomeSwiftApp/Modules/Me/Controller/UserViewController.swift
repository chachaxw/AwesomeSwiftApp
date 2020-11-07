//
//  UserViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/27.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet weak private var coverImageView: UIImageView!
    @IBOutlet weak private var userProfileView: UIView!
    @IBOutlet weak private var avatarView: UIImageView!
    @IBOutlet weak private var usernameView: UILabel!
    @IBOutlet weak private var settingButton: UIButton!
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView.delegate = self
        self.scrollView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = UIColor.clear
        self.view.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.darkGrayColor]
        self.contentView.theme_backgroundColor = [AppColors.lightGrayColor, AppColors.darkGrayColor]
        self.contentView.setRoundCorners(corners: [UIRectCorner.topLeft, UIRectCorner.topRight], with: 16.0)

        // Do any additional setup after loading the view.
        initProfileView()
        initSettingButton()
    }

    func initProfileView() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        self.userProfileView.setRoundCorners(corners: UIRectCorner.allCorners, with: 12.0)
        self.userProfileView.layer.opacity = 0.87
        self.userProfileView.addSubview(blurView)
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

    func adjustCoverImageView() {
        let contentOffsetY = scrollView.contentOffset.y

        if contentOffsetY < 0 {
            let imageHeight = coverImageView.frame.height - contentOffsetY

            print("图片高度 \(imageHeight)")
            coverImageView.frame = CGRect(x: 0, y: 0, width: coverImageView.frame.width, height: imageHeight)
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

extension UserViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        print("Y轴偏移量 \(contentOffsetY)")
        adjustCoverImageView()
    }
}
