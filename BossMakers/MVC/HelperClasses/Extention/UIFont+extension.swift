//
//  UIFont+extension.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 05/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {

    static func navigationTitleFont() -> UIFont {
        return UIFont.systemFont(ofSize: 17.0)
    }

    static func titleFont() -> UIFont {
        return UIFont.systemFont(ofSize: 17.0)
    }

    static func descriptionFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14.0)
    }

    static func customLightFont(size: CGFloat = 12.0) -> UIFont {
        return UIFont(name: CustomFont.regular.rawValue, size: size)!
    }

    static func customBoldFont(size: CGFloat = 12.0) -> UIFont {
        return UIFont(name: CustomFont.bold.rawValue, size: size)!
    }

    static func customBlackFont(size: CGFloat = 12.0) -> UIFont {
        return UIFont(name: CustomFont.black.rawValue, size: size)!
    }

    static func customMediumFont(size: CGFloat = 12.0) -> UIFont {
        return UIFont(name: CustomFont.medium.rawValue, size: size)!
    }

    static func customBookFont(size: CGFloat = 12.0) -> UIFont {
        return UIFont(name: CustomFont.book.rawValue, size: size)!
    }
}
// MARK: All Fonts

extension UIFont {

    static func allSystemFontsNames() -> [String] {
        var fontsNames = [String]()
        let fontFamilies = UIFont.familyNames
        for fontFamily in fontFamilies {
            let fontsForFamily = UIFont.fontNames(forFamilyName: fontFamily)
            for fontName in fontsForFamily {
                fontsNames.append(fontName)
            }
        }
        return fontsNames
    }
}
