//
//  FeaturedTableViewCell.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/15.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class FeaturedTableViewCell: UITableViewCell {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//        if selected {
//            contentView.backgroundColor = UIColor.Theme.LightGrayColor
//        } else {
//            contentView.backgroundColor = UIColor.white
//        }
    }

    func setDescText(desc: String) {
        self.descLabel.text = desc
    }

    func setTitleText(title: String) {
        self.titleLabel.text = title
    }

    func setCoverImage(image: UIImage) {
        self.coverImage.image = image
        self.coverImage.setRoundCorners(corners: UIRectCorner.allCorners, with: 16.0)
    }
}
