//
//  CardItem.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/7/15.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

struct CardItem: Identifiable {
    var id: String
    var label: String
    var title: String
    var imgUrl: String
    var isLiked: Bool

    init(id: String, label: String, title: String, imgUrl: String, isLiked: Bool) {
        self.id = id
        self.label = label
        self.title = title
        self.imgUrl = imgUrl
        self.isLiked = isLiked
    }
}
