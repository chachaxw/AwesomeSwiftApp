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

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var labelText: UILabel!
    @IBOutlet weak private var titleText: UILabel!
    @IBOutlet weak private var likeButton: UIButton!
    @IBOutlet weak private var coverImage: UIImageView!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setCardView() {
        self.layer.cornerRadius = 20
        self.contentView.layer.cornerRadius = 20
        self.setShadow(
            color: UIColor.Theme.LightShadowColor,
            offset: CGSize(width: 0, height: 5),
            opacity: 1,
            radius: 16
        )
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

        likeButton.radius = 10.0
        likeButton.setImage(isActive ? heartSolidIcon : heartIcon, for: .normal)
        likeButton.setShadow(
            color: UIColor.Theme.LightShadowColor,
            offset: CGSize(width: 0, height: 3),
            opacity: 0.8,
            radius: 8
        )
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
