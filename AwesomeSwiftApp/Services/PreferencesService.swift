//
//  PreferenceService.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/15.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation

import RxSwift

protocol HasPreferencesService {
    var preferencesService: PreferencesService { get }
}

/// This service manage the user preferences
class PreferencesService {

    /// sets the onBoarded preference to true
    func setOnboarded() {
        UserDefaults.Preferences.set(value: true, forKey: .onBoarded)
    }

    /// removes the onBoarded preference
    func setNotOnboarded() {
        UserDefaults.standard.removeObject(forKey: UserDefaults.Preferences.DefaultKeys.onBoarded.rawValue)
    }

    /// Returns true if the user has already onboarded, false otherwise
    ///
    /// - Returns: true if the user has already onboarded, false otherwise
    func isOnboarded () -> Bool {
        return UserDefaults.Preferences.bool(forKey: .onBoarded) ?? false
    }
}

extension PreferencesService: ReactiveCompatible {}

extension Reactive where Base: PreferencesService {
    var isOnboarded: Observable<Bool> {
        return UserDefaults.standard
            .rx
            .observe(Bool.self, UserDefaults.Preferences.DefaultKeys.onBoarded.rawValue)
            .map { $0 ?? false }
    }
}
