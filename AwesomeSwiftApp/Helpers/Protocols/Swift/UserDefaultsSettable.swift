//
//  UserDefaultsSettable.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/16.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

extension UserDefaultsSettable where defaultKeys.RawValue == String {
    static func set(value: String, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.setValue(value, forKey: aKey)
    }
    
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }
    
    static func integer(forKey key: defaultKeys) -> Int? {
        let aKey = key.rawValue
        return UserDefaults.standard.integer(forKey: aKey)
    }
    
    static func bool(forKey key: defaultKeys) -> Bool? {
        let aKey = key.rawValue
        return UserDefaults.standard.bool(forKey: aKey)
    }
    
    static func array(forKey key: defaultKeys) -> Array<Any>? {
        let aKey = key.rawValue
        return UserDefaults.standard.array(forKey: aKey)
    }
    
    static func data(forKey key: defaultKeys) -> Data? {
        let aKey = key.rawValue
        return UserDefaults.standard.data(forKey: aKey)
    }
    
    static func dictionary(forKey key: defaultKeys) -> Dictionary<String, Any>? {
        let aKey = key.rawValue
        return UserDefaults.standard.dictionary(forKey: aKey)
    }
}