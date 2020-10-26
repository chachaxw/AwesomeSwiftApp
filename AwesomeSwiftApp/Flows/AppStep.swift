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

    // Login
    case loginIsRequired
    case userIsLoggedIn

    // Onboarding
    case onboardingIsRequired
    case onboardingIsComplete

    // Home
    case homeIsRequired
    case homeIsComplete

    // Settings
    case settingsAreRequired
    case settingsAreComplete

    // About
    case aboutIsRequired
    case aboutIsComplete
}
