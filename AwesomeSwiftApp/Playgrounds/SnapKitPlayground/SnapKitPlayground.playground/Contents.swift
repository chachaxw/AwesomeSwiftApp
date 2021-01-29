//: A UIKit based Playground for presenting user interface

//
//  SnapKitPlayground.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2021/1/29.
//  Copyright © 2021 Chacha. All rights reserved.
//

import PlaygroundSupport
import SnapKit
import UIKit

class MyViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(red: 1, green: 0.6, blue: 0.6, alpha: 1)

        let label = UILabel()
        label.text = "Hello World!"
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white

        view.addSubview(label)

        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 200, height: 40))
        }

        self.view = view
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
