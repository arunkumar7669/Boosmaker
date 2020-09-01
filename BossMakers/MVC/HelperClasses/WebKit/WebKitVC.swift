//
//  WebKitVC.swift
//  CarCare
//
//  Created by Apple on 09/01/20.
//  Copyright © 2020 Ayushi. All rights reserved.
//

import UIKit
import WebKit
//import SVProgressHUD

class WebKitVC: UIViewController,WKNavigationDelegate,WKUIDelegate {
    
    var WebUrl : String? = ""
    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var webViewKit: WKWebView!
//    var successUrl : String = ""
//    var FailureUrl : String = ""
//    var isFromCheckOut = false
//    var orderId : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.backButton.setButtonBlackLayout()
        // Do any additional setup after loading the view.
        self.loadWebView()
    }
    
    
    // MARK: - LoadUrlMethods
    
    func loadWebView(){
        DispatchQueue.main.async(execute: {() -> Void in

            let url = URL (string: self.WebUrl ?? "")
            if url != nil{
//                SVProgressHUD.show()
//                SVProgressHUD.setBackgroundColor(appTextOrangeColor)
//                SVProgressHUD.setBorderColor(UIColor.customWhiteGrayColor())
//                SVProgressHUD.setForegroundColor(.white)
                self.view.isUserInteractionEnabled = false
                let requestObj = URLRequest(url: url!)
                self.webViewKit.load(requestObj)
            }
            
            
        })
        
        self.webViewKit.navigationDelegate = self
        self.webViewKit.uiDelegate = self
        
        
    }
    // MARK: - WebViewDelegate
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async(execute: {() -> Void in
            self.view.isUserInteractionEnabled = true
        })
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        DispatchQueue.main.async(execute: {() -> Void in
            self.view.isUserInteractionEnabled = true
        })
    }
    
    @IBAction func backBtn(_ sender: Any) {
             self.navigationController?.popViewController(animated: true)
    }
}





