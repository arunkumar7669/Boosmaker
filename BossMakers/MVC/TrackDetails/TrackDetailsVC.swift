//
//  TrackDetailsVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 15/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit


class TrackDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var trackDetailsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        trackDetailsTable.delegate = self
        trackDetailsTable.dataSource = self
        trackDetailsTable.register(OrderDeatailTVC.nib, forCellReuseIdentifier: OrderDeatailTVC.identifier)
        trackDetailsTable.register(TrackListTVC.nib, forCellReuseIdentifier: TrackListTVC.identifier)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 370
        }else{
            return 60
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderDeatailTVC.identifier) as? OrderDeatailTVC else { return UITableViewCell() }
          
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TrackListTVC.identifier) as? TrackListTVC else { return UITableViewCell() }
          
            
            return cell
            
       
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
