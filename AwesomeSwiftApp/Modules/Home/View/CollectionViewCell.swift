//
//  CollectionViewCell.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/3/9.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var labelText: UILabel!
    @IBOutlet weak private var titleText: UILabel!
    @IBOutlet weak private var likeButton: UIButton!
    @IBOutlet weak private var coverImage: UIImageView!

    func setCardView() {
        self.contentView.roundCorners(corners: UIRectCorner.allCorners, with: 16.0)
    }

    func setLabelText(label: String) {
        self.labelText.text = label
    }

    func setTitleText(title: String) {
        self.titleText.text = title
    }

    func setCoverImage(image: UIImage) {
        self.coverImage.image = image
        self.coverImage.sizeToFit()
    }

    func setCoverImageFromUrl(imgUrl: String) {
        let url: URL = URL(string: imgUrl)!
        let data: NSData! = NSData(contentsOf: url)

        if data != nil {
            self.coverImage.image = UIImage(data: data as Data)
        } else {
            self.coverImage.image = UIImage(named: R.image.chacha.name)
        }

        self.coverImage.sizeToFit()
    }
}
