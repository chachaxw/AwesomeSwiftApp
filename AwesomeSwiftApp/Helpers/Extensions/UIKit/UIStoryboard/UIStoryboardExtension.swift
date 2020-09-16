//
//  UIStoryboardExtension.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/13.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

extension UIStoryboard {

    /// Get the main application storyboard.
    public class var main: UIStoryboard? {
        let bundle = Bundle.main
        guard let storyboardName = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else {
            return nil
        }
        return UIStoryboard(name: storyboardName, bundle: bundle)
    }
}
