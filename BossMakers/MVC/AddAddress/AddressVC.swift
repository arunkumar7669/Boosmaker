//
//  AddressVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 10/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class AddressVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var addressTable: UITableView!
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        addressTable.delegate = self
        addressTable.dataSource = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        addressTable.register(SelectAddressTVC.nib, forCellReuseIdentifier: SelectAddressTVC.identifier)
        addressTable.register(SenterDetailsTVC.nib, forCellReuseIdentifier: SenterDetailsTVC.identifier)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 260
        }
        
        return 370
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectAddressTVC.identifier) as? SelectAddressTVC else { return UITableViewCell() }
            
            cell.btnChangeSender.tag = indexPath.row
            cell.btnChangeSender.addTarget(self, action: #selector(self.pressbtnsender(_ :)), for: .touchUpInside)
           
            return cell
            
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SenterDetailsTVC.identifier) as? SenterDetailsTVC else { return UITableViewCell() }
            cell.btnSelectCourier.tag = indexPath.row
            cell.btnSelectCourier.addTarget(self, action: #selector(self.pressbtnCourier(_ :)), for: .touchUpInside)
            cell.btnProceed.tag = indexPath.row
            cell.btnProceed.addTarget(self, action: #selector(self.pressbtnProceed(_ :)), for: .touchUpInside)
            return cell
            
        }
    }
    
    @objc func pressbtnCourier(_ sender: UIButton) {
        
        let registrationStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = registrationStoryboard.instantiateViewController(withIdentifier: "SelectCourierVC") as? SelectCourierVC else { return }
        self.navigationController?.present(nextVC, animated: false, completion: nil)
        
    }
    @objc func pressbtnProceed(_ sender: UIButton) {
        
        let registrationStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = registrationStoryboard.instantiateViewController(withIdentifier: "PaymentDescriptionVC") as? PaymentDescriptionVC else { return }
        self.navigationController?.pushViewController(nextVC, animated: false)
        
    }
    @objc func pressbtnsender(_ sender: UIButton) {
        
        let registrationStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = registrationStoryboard.instantiateViewController(withIdentifier: "SenderInforamtionVC") as? SenderInforamtionVC else { return }
        self.navigationController?.pushViewController(nextVC, animated: false)
        
    }
    
    
    
}
