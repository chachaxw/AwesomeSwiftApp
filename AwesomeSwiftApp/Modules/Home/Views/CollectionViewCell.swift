//
//  CollectionViewCell.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/3/9.
//  Copyright © 2020 Chacha. All rights reserved.
//

import FontAwesome
import Log
import UIKit

fileprivate let coverUrl = "https://avatars.githubusercontent.com/u/9986672?s=460&u=be9147643552a1a1ec8c986ec9954e8c249d6516&v=4"

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var labelText: UILabel!
    @IBOutlet weak private var titleText: UILabel!
    @IBOutlet weak private var likeButton: UIButton!
    @IBOutlet weak private var coverImage: UIImageView!

    let log = Logger()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setLabelText(label: String) {
        self.labelText.text = label
    }

    func setTitleText(title: String) {
        self.titleText.text = title
    }

    func setCoverImage(image: UIImage) {
        self.coverImage.image = image
        self.coverImage.layer.cornerRadius = 20
        self.coverImage.layer.masksToBounds = true
    }

    func setButton(isActive: Bool) {
        let heartIcon = UIImage.fontAwesomeIcon(
            name: .heart,
            style: .solid,
            textColor: UIColor.Theme.BasicGrayColor,
            size: CGSize(width: 24, height: 24)
        )
        let heartSolidIcon = UIImage.fontAwesomeIcon(
            name: .heart,
            style: .solid,
            textColor: UIColor.Theme.BasicRedColor,
            size: CGSize(width: 24, height: 24)
        )

        likeButton.layer.cornerRadius = 10
        likeButton.setImage(isActive ? heartSolidIcon : heartIcon, for: .normal)
        likeButton.setShadow(
            color: UIColor.Theme.LightShadowColor,
            offset: CGSize(width: 0, height: 3),
            opacity: 0.8,
            radius: 8
        )
        likeButton.theme_backgroundColor = [AppColors.whiteColor, AppColors.primaryColor]
    }

    func setCoverImageFromUrl(imgUrl: String) {
        let url: URL = URL(string: imgUrl) ?? URL(string: coverUrl)!
        let data: NSData! = NSData(contentsOf: url)

        if data != nil {
            self.coverImage.image = UIImage(data: data as Data)
        } else {
            self.coverImage.image = UIImage(named: R.image.chacha.name)
        }

        self.coverImage.sizeToFit()
    }

    @IBAction func handleLike(_ sender: Any) {
        log.info("收藏该Demo \(sender)")
    }
}
