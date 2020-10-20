//
//  OnboardingFlow.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/20.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation
import RxFlow
import UIKit.UINavigationController

class OnboardingFlow: Flow {
    private var loginId: String = "LoginStoryboard"

    var root: Presentable {
        self.rootViewCtrl
    }
    
    private lazy var rootViewCtrl: UINavigationController = {
        return UINavigationController()
    }()

    private let appServices: AppServices

    init(withServices services: AppServices) {
        self.appServices = services
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else {
            return .none
        }

        switch step {
        case .loginIsRequired:
            return navigateToLoginScreen()
        case .userIsLoggedIn:
            return .end(forwardToParentFlowWithStep: AppStep.onboardingIsComplete)
        default:
            return .none
        }
    }
    
    func navigateToLoginScreen() -> FlowContributors {
        guard let loginViewCtrl = R.storyboard.main()
            .instantiateViewController(withIdentifier: loginId) as? LoginViewController else {
            return .none
        }

        self.rootViewCtrl.pushViewController(loginViewCtrl, animated: false)
        return .one(flowContributor: .contribute(withNext: loginViewCtrl))
    }

}
