//
//  AppStepper.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/10/15.
//  Copyright © 2020 Chacha. All rights reserved.
//

import Foundation
import RxCocoa
import RxFlow
import RxSwift
import UIKit

class AppStepper: Stepper {
    var steps = PublishRelay<Step>()
    private let appServices: AppServices
    private let disposeBag = DisposeBag()

    init(withServices services: AppServices) {
        self.appServices = services
    }

    var initialStep: Step {
        return AppStep.homeIsRequired
    }

    /// callback used to emit steps once the FlowCoordinator is ready to listen to them to contribute to the Flow
    func readyToEmitSteps() {

    }
}
