//
//  NetworkManager.swift
//  Project Name: PoundIT
//
//  Created by Rakesh Sharma on 15/04/19.
//
//  Copyright © 2019 Rakesh Sharma. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
import SwiftMessages
import Alamofire


extension MoyaError {
    var unacceptableStatusCode: Int? {
        if case let .underlying(uError, _) = self,
            let afError = uError as? AFError,
            case let .responseValidationFailed(reason) = afError,
            case let .unacceptableStatusCode(statusCode) = reason {
            return statusCode
        } else {
            return nil
        }
    }
}

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

class NetworkManager: NSObject {
  //  var previousRequest: Ca
    private var userProvider = MoyaProvider<ApiService>(plugins: [NetworkLoggerPlugin(), MoyaPlugins.MyNetworkActivityPlugin])
    static var currentAPI: Cancellable?
    static let shared = NetworkManager()
    private override init() {}
    
    func callingHttpRequest(api: ApiService, taskCallback: @escaping (Int,
        JSON?) -> Void) {
//        self.cancelAllNetworkRequests()

        NetworkManager.currentAPI = userProvider.request(api) { (result) in
            switch result {
            case .success(let response):
                SwiftMessages.hide()
                
                if let json = try? JSONSerialization.jsonObject(with: response.data) as? [String: Any] {
                    let jsonReponse = JSON(json ?? [:])
                    let response_code = jsonReponse["response_code"].stringValue
                    if response_code == "401" {
                        //ksharedAppDelegate?.landingToLogin()
                        return
                    } else {
                         let error: Int = jsonReponse["error"].intValue
                        if error == 1 {
                            guard let message = jsonReponse["message"].dictionary else {
                                print("Api Name = ",api)
//                                if api == ApiService.myBooking(param: [:]) {
//                                let isStatus = jsonReponse["isStatus"].intValue
//                                if isStatus == 1 {
//
//                                } else {
                                    self.showError(message: jsonReponse["message"].stringValue)

                                //}
//                                }
                                taskCallback(0, jsonReponse)
                                return
                            }
                            
                            
                            if message["email"] != nil {
                                let obj = message["email"]?.arrayValue
                                self.showError(message: obj?[0].stringValue ?? "")
                            } else if message["phone_number"] != nil {
                                let obj = message["phone_number"]?.arrayValue
                                self.showError(message: obj?[0].stringValue ?? "")
                            } else if message["password"] != nil {
                                let obj = message["password"]?.arrayValue
                                self.showError(message: obj?[0].stringValue ?? "")
                            } else if message["username"] != nil {
                                let obj = message["username"]?.arrayValue
                                self.showError(message: obj?[0].stringValue ?? "")
                            }
                            else if message["name"] != nil {
                                let obj = message["name"]?.arrayValue
                                self.showError(message: obj?[0].stringValue ?? "")
                            }
                            taskCallback(0, jsonReponse)
                            return
                        }
                        logDebug("\(error)")
                        taskCallback(1, jsonReponse)
                     //  ksharedAppDelegate?.landingToLogin()
                    }
                } else {
                    let warning = MessageView.viewFromNib(layout: .cardView)
                    warning.configureTheme(.info)
                    warning.configureDropShadow()
                    warning.configureContent(title: "Infomation", body: "Something went wrong...Try after sometimes.")
                    warning.button?.setTitle("Retry", for: .normal)
                
                    warning.button?.actionHandle(controlEvents: UIControl.Event.touchUpInside,
                                        ForAction:{() -> Void in
                                            
                                            SwiftMessages.hide()
                                            taskCallback(0, JSON.null)
                    })
                    
                    SwiftMessages.show(config: self.getSwiftConfig(), view: warning)
                }
            case .failure(let error):
                if !Connectivity.isConnectedToInternet() {
                    let warning = MessageView.viewFromNib(layout: .cardView)
                    warning.configureTheme(.info)
                    warning.configureDropShadow()
                    warning.configureContent(title: "Infomation", body: "Please Check Your Internet Connection")
                    warning.button?.setTitle("Retry", for: .normal)
                    
                    warning.button?.actionHandle(controlEvents: UIControl.Event.touchUpInside,
                                                 ForAction:{() -> Void in
                                                    taskCallback(0, JSON.null)
                    })
                    
                    SwiftMessages.show(config: self.getSwiftConfig(interactive: false), view: warning)
                    
                } else {
                 
                    let errorCode = error.unacceptableStatusCode
                    if  errorCode == 401 {
                        logDebug("Unauthorize access.. token expired")
                     //   ksharedAppDelegate?.landingToLogin()
                        taskCallback(2, JSON.null)
                    } else if errorCode != -999 && errorCode != -1_005 {
                        let warning = MessageView.viewFromNib(layout: .cardView)
                        warning.configureTheme(.error)
                        warning.configureDropShadow()
                        
                        let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
                        warning.configureContent(title: "Error", body: error.localizedDescription, iconText: iconText)
                        warning.button?.setTitle("Retry", for: .normal)
                        
                        warning.button?.actionHandle(controlEvents: UIControl.Event.touchUpInside,
                                                     ForAction:{() -> Void in
                                                        
                                                        SwiftMessages.hide()
                                                        taskCallback(2, JSON.null)
                        })
                        
                        SwiftMessages.show(config: self.getSwiftConfig(), view: warning)
                    } else if errorCode == -1_005 {
                        taskCallback(2, JSON.null)
                    }
                }
            }
          }
        }
    
    private func getSwiftConfig(interactive: Bool = true) -> SwiftMessages.Config {
        var warningConfig = SwiftMessages.defaultConfig
        warningConfig.presentationStyle = .center
        warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        warningConfig.dimMode = .blur(style: .regular, alpha: 1, interactive: interactive)
        warningConfig.duration = .forever
        return warningConfig
    }
    
    func cancelAllNetworkRequests() {
        NetworkManager.currentAPI?.cancel()
    }
    
}
