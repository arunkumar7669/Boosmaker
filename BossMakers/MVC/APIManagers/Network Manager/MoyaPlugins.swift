//
//  MoyaPlugins.swift
//  Deals
//
//  Created by Vinay Piplani on 22/10/19.
//  Copyright © 2019 Piplani. All rights reserved.
//

import Foundation
import Moya
import UIKit
import Result
import SVProgressHUD



class MoyaPlugins {
    static var willShowActivityIndicatory = true
    static let MyNetworkActivityPlugin = NetworkActivityPlugin { (change, _) -> Void in
        switch(change) {
        case .ended:
            hideLoader()
        case .began:
            if willShowActivityIndicatory {
                
                showLoader()
               
            }
        }
    }
    static func showLoader(){
//         SVProgressHUD.show()
//        SVProgressHUD.setDefaultStyle(.custom)
//        SVProgressHUD.setDefaultMaskType(.custom)
//        let activityData = ActivityData()
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    static func hideLoader(){
//         SVProgressHUD.dismiss()
//        SVProgressHUD.setDefaultStyle(.custom)
//        SVProgressHUD.setDefaultMaskType(.custom)
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)

    }
    
}


final class NewLoggerPlugin: PluginType {
    var startTimes: [String: CFAbsoluteTime] = [:]
    
    func willSend(_ request: RequestType, target: TargetType) {
        startTimes[target.path] = CFAbsoluteTimeGetCurrent()
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            var items: [String] = []
            items.append("\n  ┌──────────────────────────────────────────────────────────────────────────────────────\n")
            items.append("  ├┄┄┄┄┄┄┄┄┄┄┄┄┄ API Request  Logs Started ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄\n")
            items.append("  ├ Request type: \(response.request?.httpMethod ?? "no") \n")
            items.append("  ├ Request address: \(response.request?.url?.absoluteString ?? "no") \n")
            items.append("  ├ Response code: \(response.statusCode) \n")
            items.append("  ├ All Headers: \(response.request?.allHTTPHeaderFields ?? [:]) \n")
            items.append("  ├ Request Body data: \(response.request?.httpBody?.stringValue ?? "no") \n")
            items.append("  ├ Request time consuming: \(String(format: "%.2f", time(for: target.path)))ms \n")
            items.append("  ├ Server returns data: \n\((try? response.mapJSON()) ?? "Invalid JSON Format") \n")
            items.append("  ├┄┄┄┄┄┄┄┄┄┄┄┄┄ API Request Logs Ended ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄\n")
            items.append("  └────────────────────────────────────────────────────────────────────────────────────── \n")
            outputItems(items)

        case .failure(let error):
            logDebug(error.localizedDescription)
            //            outputError(logNetworkError(error, target: target))
        }
        startTimes.removeValue(forKey: target.path)
    }
    
    func time(for path: String) -> CFAbsoluteTime {
        let start = startTimes[path] ?? 0
        return (CFAbsoluteTimeGetCurrent() - start) * 1000
    }
    
    fileprivate func outputItems(_ items: [String]) {
        logDebug(items.joined(separator: "\n"))
    }
}

extension Data {
    var stringValue: String {
        return String(data: self, encoding: .utf8) ?? ""
    }
}

