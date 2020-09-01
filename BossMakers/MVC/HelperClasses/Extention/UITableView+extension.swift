//
//  UITableView+extension.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 05/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell{
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func reloadWithoutAnimation(){
        UIView.performWithoutAnimation {
            
                let loc = self.contentOffset
                self.reloadData()
                self.contentOffset = loc
            
        }
    }
    
    
}
extension UITableView {
    func scrollToBottom(animated: Bool = true) {
        let section = self.numberOfSections
        if section > 0 {
            let row = self.numberOfRows(inSection: section - 1)
            if row > 0 {

                self.scrollToRow(at: IndexPath(row: row-1, section: section-1), at: .bottom, animated: animated)
            }
        }
    }
}
