//
//  NSObject+extension.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 22/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation
import Foundation
import Moya
import Alamofire
import SwiftyJSON
import SwiftMessages
import SwiftUI

@available(iOS 13.0, *)
@available(iOS 13.0, *)
extension NSObject {
    var isRTL: Bool {
        if Defaults().language == "ar" {
            return true
        } else {
            return false
        }
    }
    
    var appDelegate: AppDelegate {
        return (UIApplication.shared.delegate as? AppDelegate)!
    }
    func showSuccess(message: String = "Something good happened!") {
        let success = MessageView.viewFromNib(layout: .tabView)
        success.configureTheme(.success)
        success.configureDropShadow()
        if Defaults().language == "en"{
               success.configureContent(title: "Success", body: message)
               }else{
                   success.configureContent(title: "نجاح", body: message)
               }
        
        success.button?.isHidden = true
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .top
        successConfig.duration = .seconds(seconds: 0.5)
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: successConfig, view: success)
    }
    
    func showError(message: String = "Something good happened!") {
        let error = MessageView.viewFromNib(layout: .tabView)
        error.configureTheme(.error)
        error.configureContent(title: "Error", body: message)
        error.button?.isHidden = true
        var errorConfig = SwiftMessages.defaultConfig
        errorConfig.presentationStyle = .top
        errorConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: errorConfig, view: error)
    }
    
    func showInfo(message: String = "This is a very lengthy and informative info message that wraps across multiple lines and grows in height as needed.") {
        let info = MessageView.viewFromNib(layout: .messageView)
        info.configureTheme(.info)
        info.button?.isHidden = true
        info.configureContent(title: "Information", body: message)
        var infoConfig = SwiftMessages.defaultConfig
        infoConfig.presentationStyle = .top
        infoConfig.duration = .seconds(seconds: 3.0)
        SwiftMessages.show(config: infoConfig, view: info)
    }
}
