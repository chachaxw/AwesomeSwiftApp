//
//  UserDefaultKeys.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/16.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

struct UserDefaultKeys {

    // Account info
    struct AccountInfo {
        static let userName = "userName"
        static let avatar = "avatar"
        static let password = "password"
        static let gender = "gender"
        static let age = "age"
    }

    // Login info
    struct LoginInfo {
        static let token = "token"
        static let userId = "userId"
    }

    // User preferences
    struct Preferences {
        /// key for onBoarded preference
        static let onBoarded = "onBoarded"
    }
}
