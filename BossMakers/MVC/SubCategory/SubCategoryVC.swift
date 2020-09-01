//
//  SubCategoryVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 24/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class SubCategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var subCategoryTable: UITableView!
    
     var subCategoryModel             :       SubCategoryModel?
     var subCategoryBannerModel     :       SubCategoryBannerModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         subCategoryListAPI()
        bannerAPI()
         subCategoryTable.register(SubCategoryTVC.nib, forCellReuseIdentifier: SubCategoryTVC.identifier)
         subCategoryTable.register(CategoryListingTVC.nib, forCellReuseIdentifier: CategoryListingTVC.identifier)
    }
    
    func setUpTableView() {
        subCategoryTable.delegate = self
        subCategoryTable.dataSource = self
        subCategoryTable.reloadData()
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
                return 1
            }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            if indexPath.section == 0 {
                return 200
            } else{
                return 600
            }
        }
        
 
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.section {
                
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SubCategoryTVC.identifier) as? SubCategoryTVC else { return UITableViewCell() }
                 guard let subCategory = self.subCategoryModel?.Data else {
                                  return UITableViewCell()
                              }
                              cell.subCategoryData = subCategory
                              cell.subCategoryDataObj = subCategoryModel
                              cell.subCategoryCV.reloadData()
                              
                              return cell
                
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryListingTVC.identifier) as? CategoryListingTVC else { return UITableViewCell() }
                guard let banner = self.subCategoryBannerModel?.Data else {
                                  return UITableViewCell()
                              }
                              cell.bannerdata = banner
                              cell.bannerModelObj = subCategoryBannerModel
                              cell.gridView.reloadData()
                              
                              return cell
              
                
            default:
                let cell = UITableViewCell()
                return cell
            }
            
        }
    
    func subCategoryListAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        NetworkManager.shared.callingHttpRequest(api: .subCategory(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.subCategoryModel = SubCategoryModel(json : jsonResult)
            self.setUpTableView()
            
        }
    }
    
    func bannerAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        NetworkManager.shared.callingHttpRequest(api: .bannerSubCategory(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.subCategoryBannerModel = SubCategoryBannerModel(json : jsonResult)
            self.setUpTableView()
        }
    }
   

}
