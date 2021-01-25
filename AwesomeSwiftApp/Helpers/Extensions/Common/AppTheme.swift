//
//  Theme.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/13.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

enum AppThemes: Int {
    case light = 0
    case dark = 1
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat?) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpha ?? 1.0
        )
    }

    convenience init(netHex: Int, alpha: CGFloat? = 1.0) {
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff, alpha: alpha)
    }
}

extension UIColor {
    struct Theme {
        static let PrimaryColor = UIColor(netHex: 0x1d1d1d)
        static let SecondaryColor = UIColor(netHex: 0x1b60c0)
        static let LightGrayColor = UIColor(netHex: 0xf4f6f8)
        static let SecondaryGrayColor = UIColor(netHex: 0xf2f2f2)
        static let DarkGrayColor = UIColor(netHex: 0x292A2F)
        static let BasicGrayColor = UIColor(netHex: 0xB9B9B9)
        static let BasicRedColor = UIColor(netHex: 0xFF5450)
        static let LightShadowColor = UIColor(netHex: 0x000000, alpha: 0.08)
        static let DarkShadowColor = UIColor(netHex: 0x000000, alpha: 0.15)
    }

    func isDarkColor() -> Bool {
        var white: CGFloat = 0
        self.getWhite(&white, alpha: nil)
        return white > 0.5 ? false : true
    }
}
