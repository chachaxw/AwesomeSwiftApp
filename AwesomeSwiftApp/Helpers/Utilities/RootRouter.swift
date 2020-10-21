//
//  RootRouter.swift
//  AwesomeSwiftApp
//
//  Copyright © Chacha. All rights reserved.
//

import RxCocoa
import RxFlow
import RxSwift
import UIKit

class RootRouter {
    private let appServices = AppServices(
        demoService: DemoService(),
        preferencesService: PreferencesService()
    )

    private let disposeBag = DisposeBag()
    private let coordinator = FlowCoordinator()
    private var loginId: String = "LoginStoryboard"
    private var mainId: String = "MainStoryboard"

    /** Replaces root view controller. You can specify the replacment animation type.
     If no animation type is specified, there is no animation */
    func setRootViewController(controller: UIViewController, animatedWithOptions: UIView.AnimationOptions?) {
        guard let window = UIApplication.shared.keyWindow else {
            fatalError("No window in app")
        }
        if let animationOptions = animatedWithOptions, window.rootViewController != nil {
            window.rootViewController = controller
            UIView.transition(with: window, duration: 0.33, options: animationOptions, animations: {
            }, completion: nil)
        } else {
            window.rootViewController = controller
        }
    }

    func loadMainAppStructure() {
        self.coordinator.rx.willNavigate.subscribe { flow, step in
            print("will navigate to flow=\(flow) and step=\(step)")
        }.disposed(by: self.disposeBag)

        self.coordinator.rx.didNavigate.subscribe { flow, step in
            print("will navigate to flow=\(flow) and step=\(step)")
        }.disposed(by: self.disposeBag)

        let appFlow = AppFlow(services: self.appServices)

        self.coordinator.coordinate(flow: appFlow, with: AppStepper(withServices: self.appServices))

        guard let root = R.storyboard.main()
            .instantiateViewController(withIdentifier: mainId) as? RootViewController else {
                return
            }

        root.view.backgroundColor = UIColor.Theme.LightGrayColor
        setRootViewController(controller: root, animatedWithOptions: nil)
    }
}
