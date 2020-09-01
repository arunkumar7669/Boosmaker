//
//  TrackOrderVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 24/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class TrackOrderVC: UIViewController {

    @IBAction func btnTrackOrder(_ sender: UIButton) {
        
        guard let mainView = self.storyboard?.instantiateViewController(withIdentifier: "TrackDetailsVC") as? TrackDetailsVC else { return }
//        let countrId = self.categoryHomeModel?.Data[indexPath.row].id
//        mainView.catelogID = countrId
        self.navigationController?.pushViewController(mainView, animated: true)
        
    }
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
          self.tabBarController?.tabBar.isHidden = true
            
        }
        
       
    }
