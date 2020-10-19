//
//  DemoModel.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/7/15.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation
import UIKit

class DemoModel: Identifiable {
    var id: String
    var label: String
    var title: String
    var description: String
    var isLiked: Bool
    var url: String?
    
//    var imgUrl: String? = nil
    var uiImage: UIImage? = nil

    init(id: String, label: String, title: String, description: String, isLiked: Bool, uiImage: UIImage?, url: String? = nil) {
        self.id = id
        self.url = url
        self.label = label
        self.title = title
        self.isLiked = isLiked
        self.uiImage = uiImage
        self.description = description
    }
}

struct DemoMockData {
    static let list: [DemoModel] = [
        DemoModel(
            id: UUID().uuidString,
            label: "Awesome Demo",
            title: "你好, Awesome demo App",
            description: "Get an Apple Store Gift Card of up to $200 on select products " +
                "during our four-day shopping event. And more offers now through Monday.",
            isLiked: true,
            uiImage: R.image.image1()
        ),
        DemoModel(
            id: UUID().uuidString,
            label: "Featured",
            title: "最佳Swift Demo",
            description: "Weird Science Meetups, The Weird Science is an " +
                "Innovation Agency with offices in The Netherlands and New Zealand.",
            isLiked: false,
            uiImage: R.image.image2()
        ),
        DemoModel(
            id: UUID().uuidString,
            label: "Best Practise",
            title: "Swift最佳实践",
            description: "Get an Apple Store Gift Card of up to $200 on select products during " +
                "our four-day shopping event. And more offers now through Monday.",
            isLiked: false,
            uiImage: R.image.image3()
        ),
        DemoModel(
            id: UUID().uuidString,
            label: "Featured",
            title: "Swift动效实战",
            description: "Weird Science Meetups, The Weird Science is an Innovation " +
                "Agency with offices in The Netherlands and New Zealand.",
            isLiked: false,
            uiImage: R.image.image4()
        ),
        DemoModel(
            id: UUID().uuidString,
            label: "Featured",
            title: "The Best Swift Demo, How to create a side menu through swift?",
            description: "Get an Apple Store Gift Card of up to $200 on select products during" +
                "our four-day shopping event. And more offers now through Monday.",
            isLiked: false,
            uiImage: R.image.image5()
        )
    ]
}
