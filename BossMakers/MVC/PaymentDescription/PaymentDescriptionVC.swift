//
//  PaymentDescriptionVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 10/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class PaymentDescriptionVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var paymentDescTable: UITableView!
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentDescTable.delegate = self
        paymentDescTable.dataSource = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        paymentDescTable.register(CouponTVC.nib, forCellReuseIdentifier: CouponTVC.identifier)
        paymentDescTable.register(FinalPriceTVC.nib, forCellReuseIdentifier: FinalPriceTVC.identifier)
        paymentDescTable.register(PlaceOrderTVC.nib, forCellReuseIdentifier: PlaceOrderTVC.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //                if section == 0 {
        //                    return 1
        //                } else if section == 1 {
        //                    return 3
        //                }
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 235
        } else if indexPath.section == 1 {
            return 330
        }
        
        return 160
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CouponTVC.identifier) as? CouponTVC else { return UITableViewCell() }
            
            return cell
        }else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FinalPriceTVC.identifier) as? FinalPriceTVC else { return UITableViewCell() }
            
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaceOrderTVC.identifier) as? PlaceOrderTVC else { return UITableViewCell() }
            
            return cell
        }
    }
}
