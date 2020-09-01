//
//  MyCartVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class MyCartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func btnCheckOut(_ sender: UIButton) {
        let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rootTabbar") as? UITabBarController ?? UITabBarController()
        mainView.selectedIndex = 2
        self.navigationController?.pushViewController(mainView, animated: true)
        
    }
    @IBAction func backTapped(_ sender: Any) {
       self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var myCartTable: UITableView!
    
    var count = 1
    var productName:String?
    var productQuantity:Int?
    var productPrice:Int?
    var productImageURL:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        myCartTable.delegate = self
        myCartTable.dataSource = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        myCartTable.register(ItemListTVC.nib, forCellReuseIdentifier: ItemListTVC.identifier)
        myCartTable.register(PriceTVC.nib, forCellReuseIdentifier: PriceTVC.identifier)
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
        if indexPath.section == 0 {
            return 130
        }
        
        return 290
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentMethodVC") as? PaymentMethodVC ?? UIViewController()
            
             self.navigationController?.pushViewController(mainView, animated: true)
       }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTVC.identifier) as? ItemListTVC else { return UITableViewCell() }
            cell.lblName.text = productName
            cell.lblQuantity.text = "\(productQuantity ?? 0)"
            cell.lblPrice.text = "Price : " + "\(productPrice ?? 0)"
            
            let url = URL(string: productImageURL ?? "")
            let image = UIImage(named: "banner_ic")
            cell.productImageView?.kf.setImage(with: url, placeholder: image)
            
            cell.btnIncrease.tag = indexPath.row
             cell.btnDecrease.tag = indexPath.row
             
             cell.btnIncrease.addTarget(self, action: #selector(self.pressbtnIncrease(_ :)), for: .touchUpInside)
             cell.btnDecrease.addTarget(self, action: #selector(self.pressbtnDecrease(_ :)), for: .touchUpInside)
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PriceTVC.identifier) as? PriceTVC else { return UITableViewCell() }
            cell.btnOnlinePay.tag = indexPath.row
            cell.btnCOD.tag = indexPath.row
            cell.btnOnlinePay.addTarget(self, action: #selector(self.pressbtnOnline(_ :)), for: .touchUpInside)
            cell.btnCOD.addTarget(self, action: #selector(self.pressbtnCOD(_ :)), for: .touchUpInside)
            
             cell.lblPrice.text = "\((productPrice ?? 0) * (productQuantity ?? 0))"
                   cell.lblTotalPrice.text = "\((productPrice ?? 0) * (productQuantity ?? 0))"
            
            return cell
        }
    }
    
    @objc func pressbtnOnline(_ sender: UIButton) {
        
        
    }
    
    @objc func pressbtnCOD(_ sender: UIButton) {
        
        
    }
    
    
    
    
    @objc func pressbtnIncrease(_ sender: UIButton) {
        
            
        productQuantity = ((productQuantity ?? 0) + 1)
              let indexPath = IndexPath(row: 0, section: 0)
              guard let cell = self.myCartTable.cellForRow(at: indexPath) as? ItemListTVC else {
                               return
                             }
           cell.lblQuantity.text = "\(productQuantity ?? 0)"
        
        let indexPathh = IndexPath(row: 0, section: 1)
        guard let priceCell = self.myCartTable.cellForRow(at: indexPathh) as? PriceTVC else {
                         return
         }
       
        priceCell.lblPrice.text = "\((productPrice ?? 0) * (productQuantity ?? 0))"
        priceCell.lblTotalPrice.text = "\((productPrice ?? 0) * (productQuantity ?? 0))"
        
       }
      
       @objc func pressbtnDecrease(_ sender: UIButton) {
              if  productQuantity == 1 {
                         showError(message: "Quantity can't be Zero")
                         return
              }else{
                productQuantity = ((productQuantity ?? 0) - 1)
                let indexPath = IndexPath(row: 0, section: 0)
                                        guard let cell = self.myCartTable.cellForRow(at: indexPath) as? ItemListTVC else {
                                          return
                                        }
              
                      cell.lblQuantity.text = "\(productQuantity ?? 0)"
                let indexPathh = IndexPath(row: 0, section: 1)
                       guard let priceCell = self.myCartTable.cellForRow(at: indexPathh) as? PriceTVC else {
                                        return
                        }
                      priceCell.lblPrice.text = "\((productPrice ?? 0) / (productQuantity ?? 0))"
                      priceCell.lblTotalPrice.text = "\((productPrice ?? 0) / (productQuantity ?? 0))"
       }
       }
}
