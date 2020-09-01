//
//  OrdersVC.swift
//  BossMakers
//
//  Created by Saurabh Gaur on 05/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class OrdersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var orderTableView: UITableView!
    
    
    var orderModelObj : OrderListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderAPI()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        orderTableView.register(OrderListTVC.nib, forCellReuseIdentifier: OrderListTVC.identifier)
    }
    
    func setUpTableView(){
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderModelObj?.Data?.orderDetail.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 190
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTVC.identifier) as? OrderListTVC else { return UITableViewCell() }
        let imgbaseURL = ServiceUrls.imageBaseUrl
        let imagePath = self.orderModelObj?.imagepath ?? ""
        let modelImage = "/" + (self.orderModelObj?.Data?.orderDetail[indexPath.row].productImage ?? "") ?? ""
        let imgURL = imgbaseURL + imagePath + modelImage
        let url = URL(string: imgURL ?? "")
        let image = UIImage(named: "user_placeholder")
        cell.imageProduct.kf.setImage(with: url, placeholder: image)
        cell.lblName.text = "Cutomer - " + (Defaults().userName)
        cell.lblOrderId.text = "Order ID - " + "\(orderModelObj?.Data?.orderDetail[indexPath.row].id ?? 0)"
        cell.lblFrom.text = "From : " + (orderModelObj?.Data?.orderDetail[indexPath.row].customrname ?? "")
        cell.lblPrice.text = "Price : " + (orderModelObj?.Data?.orderDetail[indexPath.row].totalorderamount ?? "")
        cell.lblDate.text = orderModelObj?.Data?.orderDetail[indexPath.row].orderdate ?? ""
        
        
        if orderModelObj?.Data?.orderDetail[indexPath.row].orderstatus == 1 {
            cell.lblOrderStatus.text = "Order Pending"
        
        }else{
            
            cell.lblOrderStatus.text = "Order Deliverd"
        }
        
        cell.btntrackOrder.tag = indexPath.row
        cell.btnorderDetails.tag = indexPath.row
        
        cell.btntrackOrder.addTarget(self, action: #selector(self.pressbtntrackOrder(_ :)), for: .touchUpInside)
        cell.btnorderDetails.addTarget(self, action: #selector(self.pressbtnorderDetails(_ :)), for: .touchUpInside)
        
        return cell
    
    }
    
    @objc func pressbtntrackOrder(_ sender: UIButton) {
       
        
        guard let mainView = self.storyboard?.instantiateViewController(withIdentifier: "TrackOrderVC") as? TrackOrderVC else { return }
        
        self.navigationController?.pushViewController(mainView, animated: true)
        
    }
    
    @objc func pressbtnorderDetails(_ sender: UIButton) {
        
        
         guard let mainView = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetailVC") as? OrderDetailVC else { return }
        
        let orderNumber = self.orderModelObj?.Data?.orderDetail[sender.tag].ordernumber
        mainView.orderNumber = orderNumber
        
        self.navigationController?.pushViewController(mainView, animated: true)
        
    }
    
    func orderAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        parameters["customer_id"] = Defaults().userId
        
        NetworkManager.shared.callingHttpRequest(api: .orderListing(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.orderModelObj = OrderListModel(json : jsonResult)
            
            self.setUpTableView()
        }
    }
    
}
