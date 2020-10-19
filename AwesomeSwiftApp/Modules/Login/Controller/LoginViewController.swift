//
//  LoginViewController.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/13.
//  Copyright © 2020 Chacha. All rights reserved.
//

import FontAwesome
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet private var containerView: UIView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var pwdTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var toggleEyeButton: UIButton!
    @IBOutlet private weak var emailWrapper: UIView!
    @IBOutlet private weak var pwdWrapper: UIView!
    @IBOutlet private weak var rightArrow: UIImageView!
    
    private var toggled: Bool = false
    private let eyeIcon = UIImage.fontAwesomeIcon(
        name: .eye,
        style: .regular,
        textColor: UIColor.Theme.BasicGrayColor,
        size: CGSize(width: 18, height: 18)
    )
    private let eyeSlashIcon = UIImage.fontAwesomeIcon(
        name: .eyeSlash,
        style: .regular,
        textColor: UIColor.Theme.BasicGrayColor,
        size: CGSize(width: 18, height: 18)
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        containerView.theme_backgroundColor = [AppColors.extraLightGrayColor, AppColors.darkGrayColor]

        initLoginButton()
        initTextField()
        initToggleButton()
    }

    func initLoginButton() {
        let frame = loginButton.frame
        let radius = frame.height / 2

        loginButton.setShadow(
            color: UIColor.Theme.LightShadowColor,
            offset: CGSize(width: 0, height: 2),
            opacity: 1,
            radius: 16
        )
        loginButton.setGradientCorners(
            corners: UIRectCorner.allCorners,
            with: radius,
            startColor: UIColor(netHex: 0x4FACFE),
            endColor: UIColor(netHex: 0x00F2FE)
        )
    }

    func initTextField() {
        emailWrapper.layer.cornerRadius = emailWrapper.frame.height / 2
        emailWrapper.backgroundColor = UIColor.Theme.SecondaryGrayColor
        emailTextField.borderStyle = .none
        pwdWrapper.layer.cornerRadius = pwdWrapper.frame.height / 2
        pwdWrapper.backgroundColor = UIColor.Theme.SecondaryGrayColor
        pwdTextField.borderStyle = .none
    }

    func initToggleButton() {
        toggleEyeButton.setImage(eyeSlashIcon, for: .normal)
    }

    @IBAction func handleSubmit(_ sender: Any) {

    }

    @IBAction func togglePassword(_ sender: Any) {
        self.toggled = !self.toggled

        if toggled {
            pwdTextField.isSecureTextEntry = false
            toggleEyeButton.setImage(eyeIcon, for: .normal)
        } else {
            pwdTextField.isSecureTextEntry = true
            toggleEyeButton.setImage(eyeSlashIcon, for: .normal)
        }
    }
}
