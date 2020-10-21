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
        self.rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        let viewCtrl = UINavigationController()
        return viewCtrl
    }()

    func navigate(to step: Step) -> FlowContributors {
        switch step {
        default:
            return .none
        }
    }
    
//    func navigateToHomeScreen() -> FlowContributors {
//        
//    }

    private let services: AppServices

    init(services: AppServices) {
        self.services = services
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }
}
