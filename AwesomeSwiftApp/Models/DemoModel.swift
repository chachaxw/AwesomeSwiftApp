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
    let id: String
    let label: String
    let title: String
    let description: String
    let isLiked: Bool
    var url: String?

//    var imgUrl: String?
    var uiImage: UIImage?
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
