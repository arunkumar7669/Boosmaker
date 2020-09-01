//
//  UIbutton+extension.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 16/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import SwiftyJSON
import SwiftMessages
import SwiftUI

extension UIButton {
    private func actionHandleBlock(action:(() -> Void)? = nil) {
        struct __ {
            static var action :(() -> Void)?
        }
        if action != nil {
            __.action = action
        } else {
            __.action?()
        }
    }
    
    @objc private func triggerActionHandleBlock() {
        self.actionHandleBlock()
    }
    
    func actionHandle(controlEvents control :UIControl.Event, ForAction action:@escaping () -> Void) {
        self.actionHandleBlock(action: action)
        self.addTarget(self, action: #selector(triggerActionHandleBlock), for: control)
    }
}
