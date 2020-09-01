//
//  ShoppingBagVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 10/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class ShoppingBagVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var count = 1
    var productName:String?
    var productQuantity:Int?
    var productPrice:Int?
    var productImageURL:String?
    
    @IBOutlet weak var shoppingBagTable: UITableView!
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingBagTable.delegate = self
        shoppingBagTable.dataSource = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        shoppingBagTable.register(AddAddressTVC.nib, forCellReuseIdentifier: AddAddressTVC.identifier)
        shoppingBagTable.register(ShoopingItemListTVC.nib, forCellReuseIdentifier: ShoopingItemListTVC.identifier)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 390
//        } else if indexPath.section == 1 {
//            return 130
//        }
        
        return 170
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoopingItemListTVC.identifier) as? ShoopingItemListTVC else { return UITableViewCell() }
            cell.lblName.text = productName
            cell.lblQuantity.text = "\(productQuantity ?? 0)"
            cell.lblPrice.text = "Price : " + "\(productPrice ?? 0)"
            cell.btnIncrease.tag = indexPath.row
            cell.btnDecrease.tag = indexPath.row
            
            cell.btnIncrease.addTarget(self, action: #selector(self.pressbtnIncrease(_ :)), for: .touchUpInside)
            cell.btnDecrease.addTarget(self, action: #selector(self.pressbtnDecrease(_ :)), for: .touchUpInside)
            
            return cell
        }else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddAddressTVC.identifier) as? AddAddressTVC else { return UITableViewCell() }
           cell.lblPrice.text = "\((productPrice ?? 0) * (productQuantity ?? 0))"
            cell.btnSelectAddress.tag = indexPath.row
            cell.btnSelectAddress.addTarget(self, action: #selector(self.pressbtnAddress(_ :)), for: .touchUpInside)
            
            return cell
        }
    }
    
    @objc func pressbtnAddress(_ sender: UIButton) {
        guard let mainView = self.storyboard?.instantiateViewController(withIdentifier: "AddressVC") as? AddressVC else { return }
        //        let countrId = self.categoryHomeModel?.Data[indexPath.row].id
        //        mainView.catelogID = countrId
                self.navigationController?.pushViewController(mainView, animated: true)
        
    }
    
    @objc func pressbtnIncrease(_ sender: UIButton) {
      
          
      productQuantity = ((productQuantity ?? 0) + 1)
            let indexPath = IndexPath(row: 0, section: 0)
            guard let cell = self.shoppingBagTable.cellForRow(at: indexPath) as? ShoopingItemListTVC else {
                             return
                           }
         cell.lblQuantity.text = "\(productQuantity ?? 0)"
      
      let indexPathh = IndexPath(row: 0, section: 1)
      guard let priceCell = self.shoppingBagTable.cellForRow(at: indexPathh) as? AddAddressTVC else {
                       return
       }
     
      priceCell.lblPrice.text = "\((productPrice ?? 0) * (productQuantity ?? 0))"
      //priceCell.lblTotalPrice.text = "\((productPrice ?? 0) * (productQuantity ?? 0))"
      
     }
    
     @objc func pressbtnDecrease(_ sender: UIButton) {
            if  productQuantity == 1 {
                       showError(message: "Quantity can't be Zero")
                       return
            }else{
              productQuantity = ((productQuantity ?? 0) - 1)
              let indexPath = IndexPath(row: 0, section: 0)
                                      guard let cell = self.shoppingBagTable.cellForRow(at: indexPath) as? ShoopingItemListTVC else {
                                        return
                                      }
            
                    cell.lblQuantity.text = "\(productQuantity ?? 0)"
              let indexPathh = IndexPath(row: 0, section: 1)
                     guard let priceCell = self.shoppingBagTable.cellForRow(at: indexPathh) as? AddAddressTVC else {
                                      return
                      }
                    priceCell.lblPrice.text = "\((productPrice ?? 0) / (productQuantity ?? 0))"
                    //priceCell.lblTotalPrice.text = "\((productPrice ?? 0) / (productQuantity ?? 0))"
     }
     }
    
}
