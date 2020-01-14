//
//  Array+Utilities.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/1/13.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

extension Array {

    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }

    func filledWith(_ element: Element, max: Int) -> Self {
        var newArray = self

        if count < max {
            newArray.append(contentsOf: Array(repeating: element, count: max - count))
        }

        return newArray
    }
}
