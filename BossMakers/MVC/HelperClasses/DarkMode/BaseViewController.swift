//
//  BaseViewController.swift
//  Project Name: Mandoub Services Platform
//
//  Created by Rakesh Sharma on 23/11/19.
//  
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        NotificationCenter.default.addObserver(self, selector: #selector(self.setText), name: NSNotification.Name(rawValue: "changeLanguage"), object: nil)
    }
    
    @objc func setText(_ : NSNotification? = nil) {
        
    }
    
    

}
