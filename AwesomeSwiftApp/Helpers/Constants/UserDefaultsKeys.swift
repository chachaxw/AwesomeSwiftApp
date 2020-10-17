//
//  UserDefaultKeys.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/16.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

extension UserDefaults {

    // Account info
    struct AccountInfo: UserDefaultsSettable {
        enum DefaultKeys: String {
            case username
            case avatar
        }
    }

    // Login info
    struct LoginInfo: UserDefaultsSettable {
        enum DefaultKeys: String {
            case token
            case userId
        }
    }

    // User preferences
    struct Preferences: UserDefaultsSettable {
        enum DefaultKeys: String {
            case onBoarded
        }
    }
}
