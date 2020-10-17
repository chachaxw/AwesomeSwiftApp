//
//  UserDefaultsSettable.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/16.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

protocol UserDefaultsSettable {
    associatedtype DefaultKeys: RawRepresentable
}

extension UserDefaultsSettable where DefaultKeys.RawValue == String {
    static func set(value: Any?, forKey key: DefaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.setValue(value, forKey: aKey)
    }
    
    static func string(forKey key: DefaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }

    static func integer(forKey key: DefaultKeys) -> Int? {
        let aKey = key.rawValue
        return UserDefaults.standard.integer(forKey: aKey)
    }
    
    static func bool(forKey key: DefaultKeys) -> Bool? {
        let aKey = key.rawValue
        return UserDefaults.standard.bool(forKey: aKey)
    }

    static func array(forKey key: DefaultKeys) -> [Any]? {
        let aKey = key.rawValue
        return UserDefaults.standard.array(forKey: aKey)
    }

    static func data(forKey key: DefaultKeys) -> Data? {
        let aKey = key.rawValue
        return UserDefaults.standard.data(forKey: aKey)
    }

    static func dictionary(forKey key: DefaultKeys) -> [String: Any]? {
        let aKey = key.rawValue
        return UserDefaults.standard.dictionary(forKey: aKey)
    }
}
