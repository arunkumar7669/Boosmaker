//
//  ReturnVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 14/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class ReturnVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var returnTable: UITableView!
   
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        returnTable.delegate = self
        returnTable.dataSource = self
       returnTable.register(ReturnCommentTVC.nib, forCellReuseIdentifier: ReturnCommentTVC.identifier)
        returnTable.register(AddImageTVC.nib, forCellReuseIdentifier: AddImageTVC.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 2
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
           case 0:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: ReturnCommentTVC.identifier) as? ReturnCommentTVC else { return UITableViewCell() }
           
           
           return cell
           
       case 1:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: AddImageTVC.identifier) as? AddImageTVC else { return UITableViewCell() }
        
           return cell
           
       
           
       default:
           let cell = UITableViewCell()
           return cell
       }
       
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
           return 515
        }else{
            return 314
        }
    }
    
    
    

}
