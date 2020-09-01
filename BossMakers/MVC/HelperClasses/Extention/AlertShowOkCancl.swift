////
////  AlertShowOkCancl.swift
////  Mandoub Services Platform
////
////  Created by Apple on 20/11/19.
////  Copyright © 2019 Ashutosh Mishra. All rights reserved.
////
//
//import Foundation
//    
//class AlertShowOkCncl {
//
//     func alertOkCancel (message:String, okayHandler: @escaping (() -> ())) {
//           let alert = UIAlertController(title: "Mandoob", message: message, preferredStyle: .alert)
//           present(alert, animated: true, completion: nil)
//           let actionok = UIAlertAction.init(title: "Ok", style: .default) { (action) in
//                 okayHandler()
//           }
//           let actionCancel = UIAlertAction.init(title: "Cancel", style: .default) { (action) in
//               alert.dismiss(animated: true, completion: nil)
//           }
//           alert.addAction(actionok)
//           alert.addAction(actionCancel)
//       }
//
//
//}
//
//
