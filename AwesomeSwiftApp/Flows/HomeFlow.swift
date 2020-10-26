//
//  HomeFlow.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/25.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation
import RxFlow

class HomeFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    let rootViewController = RootViewController()
    private let services: AppServices

    init(withServices services: AppServices) {
        self.services = services
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else {
            return .none
        }

        switch step {
        case .homeIsRequired:
            return navigateToHome()
        default:
            return .none
        }
    }

    func navigateToHome() -> FlowContributors {
        guard let homeViewCtrl = R.storyboard.main().instantiateViewController(withIdentifier: "HomeStoryboard")
                as? HomeViewController else {
            return .none
        }
        self.rootViewController.tabBarController?.selectedViewController = homeViewCtrl
        return .none
    }
}
