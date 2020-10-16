//
//  TableViewCell.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/15.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak private var coverImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
