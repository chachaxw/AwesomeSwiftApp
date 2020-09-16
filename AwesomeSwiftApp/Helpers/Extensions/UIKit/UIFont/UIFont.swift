//
//  UIFont.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/9/16.
//  Copyright © 2020 Chacha. All rights reserved.
//

import UIKit

extension UIFont {
    
    /// A utility object for obtaining custom fonts that scale to support Dynamic Type.
    /// - Parameters:
    ///     - style: The TextStyle that will be apply to the font.
    ///     - traits: Optional symbolic traits applied to the font.
    ///     - sizeCategory: Constants indicating the preferred size of your content
    /// - Returns:
    @available(iOS 11.0, *)
    public class func dynamicStyle(
        _ style: UIFont.TextStyle,
        traits: UIFontDescriptor.SymbolicTraits?,
        sizeCategory: UIContentSizeCategory = .large
    ) -> UIFont {
        let traitcollection = UITraitCollection(preferredContentSizeCategory: sizeCategory)
        let defaultTraitCollection = UITraitCollection(traitsFrom: [UIScreen.main.traitCollection, traitcollection])
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style, compatibleWith: defaultTraitCollection)
        let fontDescriptor: UIFont
        
        if let traits = traits, let traitsDescriptor = descriptor.withSymbolicTraits(traits) {
            fontDescriptor = UIFont(descriptor: traitsDescriptor, size: 0)
        } else {
            fontDescriptor = UIFont(descriptor: descriptor, size: 0)
        }
        
        return UIFontMetrics(forTextStyle: style).scaledFont(for: fontDescriptor)
    }
}
