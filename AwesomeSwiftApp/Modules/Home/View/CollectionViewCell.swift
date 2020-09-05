//
//  CollectionViewCell.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/3/9.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Log
import UIKit
import FontAwesome

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var labelText: UILabel!
    @IBOutlet weak private var titleText: UILabel!
    @IBOutlet weak private var likeButton: UIButton!
    @IBOutlet weak private var coverImage: UIImageView!

    func setCardView() {
        self.setRoundCorners(corners: UIRectCorner.allCorners, with: 16.0)
    }

    func setLabelText(label: String) {
        self.labelText.text = label
    }

    func setTitleText(title: String) {
        self.titleText.text = title
    }

    func setCoverImage(image: UIImage) {
        self.coverImage.image = image
    }

    func setButton() {
        let heartIcon = UIImage.fontAwesomeIcon(
            name: .heart,
            style: .regular,
            textColor: UIColor.Theme.BasicGrayColor,
            size: CGSize(width: 24, height: 24)
        )

        likeButton.setShadow(
            color: UIColor.Theme.LightShadowColor,
            offset: CGSize(width: 0, height: 5),
            opacity: 1,
            radius: 16
        )
        likeButton.setImage(heartIcon, for: .normal)
        likeButton.setRoundCorners(corners: UIRectCorner.allCorners, with: 8.0)
    }

    func setCoverImageFromUrl(imgUrl: String) {
        let url: URL = URL(string: imgUrl) ?? URL(string: "https://github.com/chachaxw")!
        let data: NSData! = NSData(contentsOf: url)

        if data != nil {
            self.coverImage.image = UIImage(data: data as Data)
        } else {
            self.coverImage.image = UIImage(named: R.image.chacha.name)
        }

        self.coverImage.sizeToFit()
    }

    @IBAction func handleLike(_ sender: Any) {
        print("收藏该Demo \(sender)")
    }
}
