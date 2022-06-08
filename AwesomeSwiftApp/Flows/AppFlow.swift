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
    private var loginId: String = "LoginStoryboard"

    var root: Presentable {
        self.rootViewCtrl
    }

    private lazy var rootViewCtrl: UINavigationController = {
        let viewCtrl = UINavigationController()
        viewCtrl.setNavigationBarHidden(true, animated: false)
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
        case .loginIsRequired:
            return navigateToLoginScreen()
        default:
            return .none
        }
    }

    func navigateToHomeScreen() -> FlowContributors {
        let homeFlow = HomeFlow(withServices: self.services)

        Flows.use(homeFlow, when: Flows.ExecuteStrategy.ready) { [unowned self] root in
            DispatchQueue.main.async {
                self.rootViewCtrl.pushViewController(root, animated: true)
            }
        }

        return .one(
            flowContributor: .contribute(
                withNextPresentable: homeFlow,
                withNextStepper: OneStepper(withSingleStep: AppStep.loginIsRequired)
            )
        )
    }

    func navigateToLoginScreen() -> FlowContributors {
        guard let loginViewCtrl = R.storyboard.main()
            .instantiateViewController(withIdentifier: loginId) as? LoginViewController else {
            return .none
        }

        self.rootViewCtrl.present(loginViewCtrl, animated: false)
        return .one(flowContributor: .contribute(withNext: loginViewCtrl))
    }

    func navigateToOnboardingScreen() -> FlowContributors {
        let onboardingFlow = OnboardingFlow(withServices: self.services)

        Flows.use(onboardingFlow, when: Flows.ExecuteStrategy.ready) { [unowned self] root in
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
