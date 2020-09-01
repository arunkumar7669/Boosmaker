//
//  CategoryVC.swift
//  BossMakers
//
//  Created by Saurabh Gaur on 05/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

class CategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryListTable: UITableView!
    
    var categoryListModel               :  CategoryListingModel?
    var subCategoryBannerScndModel      :  SubCategoryBannerModel?
    var categoryBannerModel             :  SubCategoryBannerModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryListAPI()
        bannerAPI()
        bannerSecndAPI()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        categoryListTable.register(BannerCategoryTVC.nib, forCellReuseIdentifier: BannerCategoryTVC.identifier)
        categoryListTable.register(CategoryListTVC.nib, forCellReuseIdentifier: CategoryListTVC.identifier)
        categoryListTable.register(offerListTVC.nib, forCellReuseIdentifier: offerListTVC.identifier)
    }
    
    func categoryListAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        NetworkManager.shared.callingHttpRequest(api: .category(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.categoryListModel = CategoryListingModel(json : jsonResult)
            self.setUpTableView()
        }
    }
    
    func bannerAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        NetworkManager.shared.callingHttpRequest(api: .bannerSubCategory(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.categoryBannerModel = SubCategoryBannerModel(json : jsonResult)
            self.setUpTableView()
        }
    }
    
    func bannerSecndAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        NetworkManager.shared.callingHttpRequest(api: .bannerCategoryScnd(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.subCategoryBannerScndModel = SubCategoryBannerModel(json : jsonResult)
            self.setUpTableView()
        }
    }
    
    func setUpTableView() {
        categoryListTable.delegate = self
        categoryListTable.dataSource = self
        categoryListTable.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    
    //----tableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 130
        }else if indexPath.row == 1{
            return 130
        }else{
            return CGFloat(140*(categoryListModel?.Data.count ?? 0))
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TrackOrderVC") as? TrackOrderVC ?? UIViewController()
        
        self.navigationController?.pushViewController(mainView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: offerListTVC.identifier) as? offerListTVC else { return UITableViewCell() }
            guard let banner = self.categoryBannerModel?.Data else {
                return UITableViewCell()
            }
            cell.bannerdata = banner
            cell.bannerModelObj = categoryBannerModel
            cell.categorySecondBanner.reloadData()
            
            return cell
            
            return cell
            
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerCategoryTVC.identifier) as? BannerCategoryTVC else { return UITableViewCell() }
            guard let bannerScnd = self.subCategoryBannerScndModel?.Data else {
                return UITableViewCell()
            }
            cell.bannerCatdata = bannerScnd
            cell.bannerCatModelObj = subCategoryBannerScndModel
            cell.bannerCategoryScndTable.reloadData()
            
            return cell
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryListTVC.identifier) as? CategoryListTVC else { return UITableViewCell() }
            
            guard let categoryData = self.categoryListModel?.Data else {
                return UITableViewCell()
            }
            cell.categoryModelObj = categoryData
            cell.categoryImageModel = categoryListModel
            
            return cell
            
            
        default:
            let cell = UITableViewCell()
            return cell
        }
        
    }
}
