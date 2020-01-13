//
//  DefaultMenuItem.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/1/13.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

struct DefaultMenuItem: MenuItem {
    let id = UUID().uuidString
    let title: String
    let imageName: String
    let selectedImageName: String
}

extension DefaultMenuItem {
    static var empty: DefaultMenuItem {
        DefaultMenuItem(title: "", imageName: "", selectedImageName: "")
    }
}
