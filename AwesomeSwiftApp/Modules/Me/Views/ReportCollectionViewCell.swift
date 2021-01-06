//
//  ReportCollectionViewCell.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/11/12.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class ReportCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var numLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        self.contentView.layer.cornerRadius = 12
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setLabel(num: String, title: String) {
        numLabel.text = num
        titleLabel.text = title
    }
}
