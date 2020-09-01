//
//  ViewController.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 03/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
  
    override func viewWillAppear(_ animated: Bool) {
            if Defaults().userId.isEmpty {
                       self.setUpLandingLoginViewController()
                   } else {
                       self.setUpInitialViewController()
                   }
        }
        func setUpLandingLoginViewController()  {
            let nextVC = LoginVC.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(nextVC, animated: false)
        }
        
        func setUpInitialViewController() {
            let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rootTabbar") as? UITabBarController ?? UITabBarController()
            mainView.selectedIndex = 0
            self.navigationController?.pushViewController(mainView, animated: true)
        }
    }




