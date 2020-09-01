//
//  CommonHelper.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 18/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import UIKit
import SwiftyJSON
import Moya
import Alamofire


class CommonHelper: NSObject {

    private override init() {
    }
    
    static let getIntance : CommonHelper = {
        let getIntance = CommonHelper()
        return getIntance
    }()
    func convertJsonToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                logDebug(error.localizedDescription)
               
            }
        }
        return [:]
    }
    func convertJsonToArray(text: String) -> [Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [Any]
            } catch {
                logDebug(error.localizedDescription)
                
            }
        }
        return []
    }
    
    func checkKey(dic: JSON) {
        
    }
    
//    func uploadRequestWithPUT(endUrl: String, imageData: Data?, completion: @escaping (_ result:String?) ->()){
//        
//        var r  = URLRequest(url: URL(string: endUrl)!)
//        r.httpMethod = "POST"
//        let boundary = "Boundary-\(UUID().uuidString)"
//        r.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        
//        
//        
//        r.httpBody = createBody(parameters: params,
//                                boundary: boundary,
//                                data: UIImageJPEGRepresentation(chosenImage, 0.7)!,
//                                mimeType: "image/jpg",
//                                filename: "hello.jpg")
//        
//        
////        let request : NSMutableURLRequest = NSMutableURLRequest()
////        request.url = URL(string: endUrl)
////        request.httpMethod = "PUT"
////
////        let task = URLSession.shared.uploadTask(with: request as URLRequest, from: imageData){
////            (data, response, error) in
////            // check for any errors
////            guard error == nil else {
////                print("error calling POST on HitServices is\(String(describing: error))")
////                completion("fail" as String)
////                return
////            }
////
////            DispatchQueue.main.async {
////                // make sure we got data
////                completion("done" as String)
////            }
////        }
////        task.resume()
//    }
    
   // hasNotch()
    func hasNotch() -> Bool {
        let window = UIApplication.shared.keyWindow;
        let bottomPadding = window?.safeAreaInsets.bottom
        let cg: CGFloat = 0
        if bottomPadding == cg {
            return false
        } else {
            return true
        }
    }
}

//extension UIViewController {
//
//  public func showOkAlert(withMessage message: String, _ completion:(() -> Void)? = nil) {
//    let alert = UIAlertController(title: SET_ALERT_TEXT(key:Constant.GlobalConstants.KAPPTitle as NSString) as String, message: message, preferredStyle: .alert)
//    alert.view.tintColor = UIColor.customOrangeTextColor()
//    let okAction = UIAlertAction(title: SET_ALERT_TEXT(key:Constant.GlobalConstants.KOk as NSString) as String, style: .cancel) { (_) in
//      DispatchQueue.main.async { completion?() }
//    }
//    alert.addAction(okAction)
//    present(alert, animated: true, completion: nil)
//  }
//
//}

extension UIImage {

    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    func resizedTo1MB() -> UIImage? {
        guard let imageData = self.pngData() else { return nil }
        let megaByte = 1000.0

        var resizingImage = self
        var imageSizeKB = Double(imageData.count) / megaByte // ! Or devide for 1024 if you need KB but not kB

        while imageSizeKB > megaByte { // ! Or use 1024 if you need KB but not kB
            guard let resizedImage = resizingImage.resized(withPercentage: 0.3),
            let imageData = resizedImage.pngData() else { return nil }

            resizingImage = resizedImage
            imageSizeKB = Double(imageData.count) / megaByte // ! Or devide for 1024 if you need KB but not kB
        }

        return resizingImage
    }
}


//extension UIImage {
//    func resizeWithPercent(percentage: CGFloat) -> UIImage? {
//        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: size.width * percentage, height: size.height * percentage)))
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = self
//        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
//        guard let context = UIGraphicsGetCurrentContext() else { return nil }
//        imageView.layer.render(in: context)
//        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
//        UIGraphicsEndImageContext()
//        return result
//    }


//    func resizedTo1MB(width: CGFloat) -> UIImage? {
//        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = self
//        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
//        guard let context = UIGraphicsGetCurrentContext() else { return nil }
//        imageView.layer.render(in: context)
//        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
//        UIGraphicsEndImageContext()
//        return result
//    }
//}
