//
//  OrderDetailVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class OrderDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var orderDetailTable: UITableView!
    
    var orderNumber:String?
    var orderDetailModelObj : OrderDeatilsModel?
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderDetailAPI()
       
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        orderDetailTable.register(CustomerInfoTVC.nib, forCellReuseIdentifier: CustomerInfoTVC.identifier)
        orderDetailTable.register(ProductViewTVC.nib, forCellReuseIdentifier: ProductViewTVC.identifier)
        orderDetailTable.register(OrderPriceTVC.nib, forCellReuseIdentifier: OrderPriceTVC.identifier)
    }
    
    func setUpTableView(){
        orderDetailTable.delegate = self
        orderDetailTable.dataSource = self
        orderDetailTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return orderDetailModelObj?.data.count ?? 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 399
        } else if indexPath.section == 1 {
            return 145
        }
        
        return 170
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyActivityVC") as? MyActivityVC ?? UIViewController()
        
          self.navigationController?.pushViewController(mainView, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomerInfoTVC.identifier) as? CustomerInfoTVC else { return UITableViewCell() }
          //  cell.lblOrderID.text = "\(orderDetailModelObj?.data[indexPath.row].id ?? 0)"
            if orderDetailModelObj?.data[indexPath.row].orderstatus == 1 {
                cell.lblOrderStatus.text = "Pending"
            }else{
                cell.lblOrderStatus.text = "Delivered"
            }
           // cell.lblSupplier.text = orderDetailModelObj?.data[0].
            cell.lblPaymentMethod.text = orderDetailModelObj?.data[indexPath.row].paymentmethod
           // cell.lblSenderName.text = orderDetailModelObj.data[0].
            cell.lblCustomerName.text = orderDetailModelObj?.data[indexPath.row].customrname
            cell.lblCustomerContact.text = orderDetailModelObj?.data[indexPath.row].customerphone
            cell.txtAddress.text = orderDetailModelObj?.data[indexPath.row].customeraddress
            return cell
        }else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductViewTVC.identifier) as? ProductViewTVC else { return UITableViewCell() }
            cell.lblPrice.text = "Price : " + (orderDetailModelObj?.data[indexPath.row].productprice ?? "")
            cell.lblQuantity.text = "Quantity : " + (orderDetailModelObj?.data[indexPath.row].productqty ?? "")
           // cell.lblSize.text = "Size : " + (orderDetailModelObj?.data[indexPath.row].s ?? "")
                        let imgbaseURL = ServiceUrls.imageBaseUrl
                                   let imagePath = self.orderDetailModelObj?.imagepath ?? ""
                                   let modelImage = "/" + (self.orderDetailModelObj?.data[indexPath.row].productimage ?? "") ?? ""
                                   let imgURL = imgbaseURL + imagePath + modelImage
                                   let url = URL(string: imgURL ?? "")
                                   let image = UIImage(named: "user_placeholder")
                                   cell.imageProduct?.kf.setImage(with: url, placeholder: image)
            
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderPriceTVC.identifier) as? OrderPriceTVC else { return UITableViewCell() }
            
            return cell
        }
    }
    
    func orderDetailAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        parameters["order_number"] = orderNumber
        
        NetworkManager.shared.callingHttpRequest(api: .orderDetails(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.orderDetailModelObj = OrderDeatilsModel(json : jsonResult)
            self.setUpTableView()
        }
    }
    
}
