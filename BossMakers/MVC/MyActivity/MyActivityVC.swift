//
//  MyActivityVC.swift
//  BossMakers
//
//  Created by Saurabh Gaur on 06/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class MyActivityVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var activityListTable: UITableView!
    
    @IBOutlet weak var backTapped: UIButton!
    
    
    @IBAction func backTappedAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        activityListTable.delegate = self
        activityListTable.dataSource = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        activityListTable.register(ActivityListTVC.nib, forCellReuseIdentifier: ActivityListTVC.identifier)
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentDescriptionVC") as? PaymentDescriptionVC ?? UIViewController()
                
          self.navigationController?.pushViewController(mainView, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 210
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ActivityListTVC.identifier) as? ActivityListTVC else { return UITableViewCell() }
        
        return cell
        
        
        
    }
}
