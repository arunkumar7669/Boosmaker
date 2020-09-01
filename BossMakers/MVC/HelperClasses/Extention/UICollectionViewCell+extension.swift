//
//  UICollectionViewCell+extension.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 05/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    static var nib:UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    static var identifier:String {
        return String(describing: self)
    }
}


