//
//  Reusable.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/13.
//  Copyright © 2020 Chacha. All rights reserved.
//

#if canImport(SwiftUI)
import UIKit

/// Make your `UITableViewCell` and `UICollectionViewCell` conform to `Reusable`
/// to dequeue them safely when they are only code based.
public protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

/// Make your `UITableViewCell` and `UICollectionViewCell` conform to `NibReusable`
/// to dequeue them safely when they are Nib-based.
public typealias NibReusable = Reusable & NibLoadable

extension Reusable {

    /// Use the name of the `class` as `String` for its `reuseIdentifier`
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}

#endif
