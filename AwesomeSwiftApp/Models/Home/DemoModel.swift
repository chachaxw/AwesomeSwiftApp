//
//  DemoModel.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/7/15.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation
import UIKit

struct DemoModel: Identifiable {
    var id: String
    var label: String
    var title: String
    var isLiked: Bool
//    var imgUrl: String? = nil
    var uiImage: UIImage? = nil

    init(id: String, label: String, title: String, isLiked: Bool, uiImage: UIImage?) {
        self.id = id
        self.label = label
        self.title = title
        self.isLiked = isLiked
        self.uiImage = uiImage
    }
}
