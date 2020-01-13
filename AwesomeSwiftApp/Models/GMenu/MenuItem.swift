//
//  MenuItem.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/1/13.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

public protocol MenuItem {
    var id: String { get }
    var title: String { get }
    var imageName: String { get }
    var selectedImageName: String { get }
    var isSelected: Bool { get }
    
    func setSelected()
}

extension Array: Identifiable where Element: MenuItem {
    public var id: String {
        map { $0.id }.joined()
    }
}
