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
        let cornerRadius: CGFloat = 16.0
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.08
        self.layer.shadowPath = shadowPath.cgPath
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
