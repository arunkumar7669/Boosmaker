//
//  ProductViewVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 12/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON
import DropDown

class ProductViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func cartBtn(_ sender: UIButton) {
        
        
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
         self.navigationController?.popViewController(animated: true)
        
    }
    @IBOutlet weak var lblHeader: UILabel!
    
    @IBOutlet weak var productViewTable: UITableView!
    
    var catelogDetailsModelObj : CatelogDetailsModel?
    var pinCodeModelObj : PincodeModel?
    var reviewByCustomerModelObj: ReviewByCustomerModel?
    var productValueModelObj : ProductValueModel?
    
    var catelogID:Int?
    var count = 1
    var msg:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catelogDetailAPI()
        reviewListAPI()
        productValueAPI()
        self.tabBarController?.tabBar.isHidden = true
        productViewTable.register(ProductHeaderTVC.nib, forCellReuseIdentifier: ProductHeaderTVC.identifier)
        productViewTable.register(ProductDescTVC.nib, forCellReuseIdentifier: ProductDescTVC.identifier)
        productViewTable.register(ProductSizeTVF.nib, forCellReuseIdentifier: ProductSizeTVF.identifier)
        productViewTable.register(ProductRatingsTVC.nib, forCellReuseIdentifier: ProductRatingsTVC.identifier)
        productViewTable.register(ProductReviewTVC.nib, forCellReuseIdentifier: ProductReviewTVC.identifier)
        productViewTable.register(ProductFooterTVC.nib, forCellReuseIdentifier: ProductFooterTVC.identifier)
    }
    
    func catelogDetailAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        parameters["catalogue_id"] = catelogID
        
        NetworkManager.shared.callingHttpRequest(api: .catelogDetails(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.catelogDetailsModelObj = CatelogDetailsModel(json : jsonResult)
            self.lblHeader.text = self.catelogDetailsModelObj?.Data?.productDetail?.description
            self.setUpTableView()
        }
    }
    
    func productValueAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        parameters["product_attribute_id"] = "55"
        
        NetworkManager.shared.callingHttpRequest(api: .productValue(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.productValueModelObj = ProductValueModel(json : jsonResult)
           
        }
    }
    
    
    func reviewListAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        parameters["customer_id"] = Defaults().userId
        
        NetworkManager.shared.callingHttpRequest(api: .reviewByCustomer(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.reviewByCustomerModelObj = ReviewByCustomerModel(json : jsonResult)
            self.setUpTableView()
        }
    }
    
    func setUpTableView() {
        productViewTable.delegate = self
        productViewTable.dataSource = self
        productViewTable.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 4 {
            return reviewByCustomerModelObj?.data.count ?? 0
        }else{
            return 1
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        } else if indexPath.section == 1 {
            return 560
        } else if indexPath.section == 2 {
            return 415
        } else if indexPath.section == 3 {
            return 170
        } else if indexPath.section == 4 {
            return 100
        } else {
            return 75
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductHeaderTVC.identifier) as? ProductHeaderTVC else { return UITableViewCell() }
            guard let imageData = self.catelogDetailsModelObj?.Data?.productImage else {
                return UITableViewCell()
            }
            cell.catelogImageModel = imageData
            cell.catelogDetailsModel = catelogDetailsModelObj
            cell.gridView.reloadData()
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductDescTVC.identifier) as? ProductDescTVC else { return UITableViewCell() }
            
            cell.lblProductName.text = self.catelogDetailsModelObj?.Data?.productDetail?.cataloguename
            cell.lblProductCode.text = "Product Code: " + (self.catelogDetailsModelObj?.Data?.productDetail?.sku ?? "")
            cell.lblMrp.text = "\(self.catelogDetailsModelObj?.Data?.productDetail?.mrp ?? 0)"
            cell.lblBossMakerPrice.text = "\(self.catelogDetailsModelObj?.Data?.productDetail?.sellingprice ?? 0)"
            cell.lblFinalPrice.text = "\(self.catelogDetailsModelObj?.Data?.productDetail?.sellingprice ?? 0)"
            cell.lblDescription.text = "Description: " + (self.catelogDetailsModelObj?.Data?.productDetail?.description ?? "")
            cell.lblLength.text = "Lenghth: " + "\(self.catelogDetailsModelObj?.Data?.productDetail?.lenth ?? 0)"
            cell.lblType.text = "Type: " + (self.catelogDetailsModelObj?.Data?.productType?.producttypename ?? "")
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductSizeTVF.identifier) as? ProductSizeTVF else { return UITableViewCell() }
            cell.pinCode = self.pinCodeModelObj?.Data?.deliverycodes[indexPath.row].postalcode
            cell.btnIncrease.tag = indexPath.row
            cell.btndecrease.tag = indexPath.row
            cell.btnSubmitPin.tag = indexPath.row
            cell.btnColor.tag = indexPath.row
            cell.btnIncrease.addTarget(self, action: #selector(self.pressbtnIncrease(_ :)), for: .touchUpInside)
            cell.btndecrease.addTarget(self, action: #selector(self.pressbtnDecrease(_ :)), for: .touchUpInside)
            cell.btnSubmitPin.addTarget(self, action: #selector(self.pressbtnSubmitPin(_ :)), for: .touchUpInside)
            cell.btnColor.addTarget(self, action: #selector(self.pressbtnDropDownColor(_ :)), for: .touchUpInside)
            
            
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductRatingsTVC.identifier) as? ProductRatingsTVC else { return UITableViewCell() }
            
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductReviewTVC.identifier) as? ProductReviewTVC else { return UITableViewCell() }
            cell.reviewerName.text = reviewByCustomerModelObj?.data[indexPath.row].ReviewTitle
            cell.lblReviewComment.text = reviewByCustomerModelObj?.data[indexPath.row].ReviewComment
            cell.ratingUp.text = "\(reviewByCustomerModelObj?.data[indexPath.row].Nooflikes ?? 0)"
            
            cell.ratingDown.text = "\(reviewByCustomerModelObj?.data[indexPath.row].Noofdislike ?? 0)"
            cell.reatingView.rating = Double(reviewByCustomerModelObj?.data[indexPath.row].ReviewRating ?? Int(0.0))
            
            return cell
            
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductFooterTVC.identifier) as? ProductFooterTVC else { return UITableViewCell() }
            cell.btnAddtoCart.addTarget(self, action: #selector(self.pressbtnAddtoCart(_ :)), for: .touchUpInside)
            
            return cell
            
        default:
            let cell = UITableViewCell()
            return cell
        }
        
    }
    
    @objc func pressbtnFilter(_ sender: UIButton) {
        let registrationStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = registrationStoryboard.instantiateViewController(withIdentifier: "BrandListVC") as? BrandListVC else { return }
        nextVC.providesPresentationContextTransitionStyle = true
        nextVC.definesPresentationContext = true
        nextVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        nextVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.navigationController?.present(nextVC, animated: false, completion: nil)
        
    }
    
    @objc func pressbtnDropDownColor(_ sender: UIButton) {
         let indexPath = IndexPath(row: 0, section: 2)
        guard let cellll = self.productViewTable.cellForRow(at: indexPath) as? ProductSizeTVF else {
                   return
               }
        
       let colordropDown = DropDown()
              
              /// RTL.
              colordropDown.customCellConfiguration = { [weak self] (_, _, cell: DropDownCell) -> Void in
                  
                  cell.optionLabel.textAlignment =  .left
              }
             
              colordropDown.anchorView = sender
              colordropDown.width = 280
        colordropDown.dataSource = (self.productValueModelObj?.Data?.productattributedata.map { $0.value ?? "" } ?? [""])
              colordropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                  
                  //                label.text = item
                  //sender.setTitle(item, for: .normal)
                  cellll.lblColor.text = item
//                  let id = self.cityDataModel?.Data[index].id
//                  self.cityDataModel?.Data[sender.tag].id = id ?? 0
//                  self.cityDataID = "\(id)"
              }
              colordropDown.show()
              
          }
    
    
    @objc func pressbtnSubmitPin(_ sender: UIButton) {
        let indexPath = IndexPath(row: 0, section: 2)
        guard let cell = self.productViewTable.cellForRow(at: indexPath) as? ProductSizeTVF else { return }
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        parameters["pincode"] = cell.pinCodeTF
        
        NetworkManager.shared.callingHttpRequest(api: .pincodeCheck(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.msg =  jsonResult["Message"].stringValue
            
            self.pinCodeModelObj = PincodeModel(json : jsonResult)
            
        }
        
    }
    
    @objc func pressbtnIncrease(_ sender: UIButton) {
        count = (count + 1)
        let indexPath = IndexPath(row: 0, section: 2)
        guard let cell = self.productViewTable.cellForRow(at: indexPath) as? ProductSizeTVF else {
            return
        }
        cell.lblCount.text = "\(count)"
    }
    
    @objc func pressbtnDecrease(_ sender: UIButton) {
        if  count == 1 {
            showError(message: "Quantity can't be Zero")
            return
        }else{
            count = (count - 1)
            let indexPath = IndexPath(row: 0, section: 2)
            guard let cell = self.productViewTable.cellForRow(at: indexPath) as? ProductSizeTVF else {
                return
            }
            
            cell.lblCount.text = "\(count)"
        }
    }
    
    @objc func pressbtnAddtoCart(_ sender: UIButton) {
        
        let mainView = self.storyboard?.instantiateViewController(withIdentifier: "ShoppingBagVC") as? ShoppingBagVC
        let productName = self.catelogDetailsModelObj?.Data?.productDetail?.cataloguename
        mainView?.productName = productName
        let productPrice = self.catelogDetailsModelObj?.Data?.productDetail?.sellingprice
        mainView?.productPrice = productPrice


        let indexPath = IndexPath(row: 0, section: 2)
        guard let cell = self.productViewTable.cellForRow(at: indexPath) as? ProductSizeTVF else {
            return
        }
        let quantity:Int =  Int(cell.lblCount?.text ?? "") ?? 0
        mainView?.productQuantity = quantity
        mainView?.providesPresentationContextTransitionStyle = true
        mainView?.definesPresentationContext = true
        mainView?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        mainView?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
      self.navigationController?.pushViewController(mainView!, animated: true)
        
       
        
    }
    
    
}

