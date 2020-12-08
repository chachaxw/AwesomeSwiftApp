//
//  ReportItemModel.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/12/8.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

struct ReportItemModel {
    let title: String
    let num: Int
}

struct ReportMockData {
    static let list: [ReportItemModel] = [
        ReportItemModel(title: "Created", num: 3),
        ReportItemModel(title: "Following", num: 12),
        ReportItemModel(title: "Favorites", num: 21),
        ReportItemModel(title: "Recently", num: 32),
    ]
}
