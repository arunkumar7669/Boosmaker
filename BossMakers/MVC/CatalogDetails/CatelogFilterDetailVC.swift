//
//  CatelogFilterDetailVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 25/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class CatelogFilterDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    var catelogID:Int?
    
    @IBOutlet weak var catFilterTable: UITableView!
    
    @IBAction func backTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        setUpTableView()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        catFilterTable.register(CatalogProductTVC.nib, forCellReuseIdentifier: CatalogProductTVC.identifier)
        catFilterTable.register(CatalogProductListTVC.nib, forCellReuseIdentifier: CatalogProductListTVC.identifier)
    }
    
    func setUpTableView() {
        catFilterTable.delegate = self
        catFilterTable.dataSource = self
        catFilterTable.reloadData()
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
       
        } else{
            return 270
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           if section == 0 {
                   return 1
              
               }else{
                   return 2
                   
               }
           }
       
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           switch indexPath.section {
               
           case 0:
               guard let cell = catFilterTable.dequeueReusableCell(withIdentifier: CatalogProductTVC.identifier) as? CatalogProductTVC else { return UITableViewCell() }
             
               
               return cell
               
           case 1:
               guard let cell = catFilterTable.dequeueReusableCell(withIdentifier: CatalogProductListTVC.identifier) as? CatalogProductListTVC else { return UITableViewCell() }
               
               
               return cell
               
           
               
           default:
               let cell = UITableViewCell()
               return cell
           }
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let mainView = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewVC") as? ProductViewVC else { return }
            mainView.catelogID = catelogID
                self.navigationController?.pushViewController(mainView, animated: true)
    }


}
