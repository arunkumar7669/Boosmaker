//
//  UIColor+extension.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 04/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let red1 = Int(color >> 16) & mask
        let green1 = Int(color >> 8) & mask
        let blue1 = Int(color) & mask
        let red = CGFloat(red1) / 255.0
        let green = CGFloat(green1) / 255.0
        let blue = CGFloat(blue1) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func toHexString() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var aaa: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &aaa)
        let rgb: Int = (Int)(red * 255) << 16 | (Int)(green * 255) << 8 | (Int)(blue * 255) << 0
        return String(format: "#%06x", rgb)
    }
}
