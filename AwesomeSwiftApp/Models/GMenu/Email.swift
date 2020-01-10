//
//  Email.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/1/10.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

struct Email: Identifiable {
    let id = UUID()
    let sender: String
    let time: String
    let title: String
    let description: String
}
