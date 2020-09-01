//
//  UICellectionViewEmptyMessage+extention.swift
//  Mandoub Services Platform
//
//  Created by Harish on 24/08/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation
import UIKit
extension UITableView {
    func showEmptyMessage(_ msg: String) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: self.bounds.size.width, height: self.bounds.size.height))
        let messageLabel = UILabel(frame: rect)
        messageLabel.text = msg
        messageLabel.textColor = UIColor.white
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 22)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel;
        //        self.separatorStyle = .none
    }
    
    func removeEmptyMsg() {
        self.backgroundView = nil
    }
}

