//
//  AnyOptional.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/16.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

public protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    public var isNil: Bool {
        self == nil
    }
}
