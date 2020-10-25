//
//  AppFlow.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/26.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation
import RxCocoa
import RxFlow
import RxSwift
import UIKit

class AppFlow: Flow {
    var root: Presentable {
        self.rootViewCtrl
    }

    private lazy var rootViewCtrl: RootViewController = {
        let viewCtrl = RootViewController()
        return viewCtrl
    }()

    private let services: AppServices

    init(services: AppServices) {
        self.services = services
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else {
            return .none
        }

        switch step {
        case .homeIsRequired:
            return navigateToHomeScreen()
        case .onboardingIsComplete:
            return navigateToOnboardingScreen()
        default:
            return .none
        }
    }

    func navigateToHomeScreen() -> FlowContributors {
        let homeFlow = HomeFlow(withServices: self.services)

        Flows.whenReady(flow1: homeFlow) { [unowned self] root in
            DispatchQueue.main.async {
                self.rootViewCtrl.present(root, animated: true)
            }
        }

        return .one(
            flowContributor: .contribute(
                withNextPresentable: homeFlow,
                withNextStepper: OneStepper(withSingleStep: AppStep.loginIsRequired)
            )
        )
    }

    func navigateToOnboardingScreen() -> FlowContributors {
        let onboardingFlow = OnboardingFlow(withServices: self.services)

        Flows.whenReady(flow1: onboardingFlow) { [unowned self] root in
            DispatchQueue.main.async {
                self.rootViewCtrl.present(root, animated: true)
            }
        }

        return .one(
            flowContributor: .contribute(
                withNextPresentable: onboardingFlow,
                withNextStepper: OneStepper(withSingleStep: AppStep.loginIsRequired)
            )
        )
    }
}
