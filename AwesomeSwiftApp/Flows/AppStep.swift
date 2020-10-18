//
//  AppStep.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/29.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation
import RxFlow

enum AppStep: Step {
    // Global
    case logoutIsRequired
    case unauthorized

    // Api Key
    case apiKeyIsRequired
    case apiKeyIsFilledIn

    // Login
    case loginIsRequired
    case userIsLoggedIn

    // Home
    case homeIsRequired

    // Settings
    case settingsAreRequired
    case settingsAreComplete

    // About
    case aboutIsRequired
    case aboutIsComplete
}
