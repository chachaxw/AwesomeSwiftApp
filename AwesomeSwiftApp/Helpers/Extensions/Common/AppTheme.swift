//
//  Theme.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/13.
//  Copyright © 2019 Chacha. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(netHex: Int) {
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff)
    }
}

extension UIColor {
    struct Theme {
        static let PrimaryColor = UIColor(netHex: 0x274396)
        static let SecondaryColor = UIColor(netHex: 0x1b60c0)
        static let LightGrayColor = UIColor(netHex: 0xf4f6fc)
    }
    
    func isDarkColor() -> Bool {
        var w: CGFloat = 0
        
        self.getWhite(&w, alpha: nil)
        return w > 0.5 ? false : true
    }
}
