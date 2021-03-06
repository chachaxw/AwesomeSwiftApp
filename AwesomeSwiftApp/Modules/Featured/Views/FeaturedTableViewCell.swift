//
//  FeaturedTableViewCell.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/15.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class FeaturedTableViewCell: UITableViewCell {
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!

    override open var frame: CGRect {
        get {
            return super.frame
        }

        set (newFrame) {
            var frame = newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 10
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
        self.layer.cornerRadius = 16.0
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
        self.coverImage.setRoundCorners(corners: UIRectCorner.allCorners, with: 14.0)
    }
}
