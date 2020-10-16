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
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: UserDefaultKeys.Preferences.onBoarded)
    }

    /// removes the onBoarded preference
    func setNotOnboarded() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: UserDefaultKeys.Preferences.onBoarded)
    }

    /// Returns true if the user has already onboarded, false otherwise
    ///
    /// - Returns: true if the user has already onboarded, false otherwise
    func isOnboarded () -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: UserDefaultKeys.Preferences.onBoarded)
    }
}

extension PreferencesService: ReactiveCompatible {}

extension Reactive where Base: PreferencesService {
    var isOnboarded: Observable<Bool> {
        return UserDefaults.standard
            .rx
            .observe(Bool.self, UserDefaultKeys.Preferences.onBoarded)
            .map { $0 ?? false }
    }
}
