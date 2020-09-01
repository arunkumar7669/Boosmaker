//
//  SelectCourierVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 10/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

class SelectCourierVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var courierTable: UITableView!
    
    @IBAction func backTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    var courierListModel : CourierModel?

    override func viewDidLoad() {
        super.viewDidLoad()
      view.isOpaque = false
      view.backgroundColor = .clear
        orderAPI()
        
        courierTable.register(CourierTVC.nib, forCellReuseIdentifier: CourierTVC.identifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courierListModel?.data.count ?? 0
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourierTVC.identifier) as? CourierTVC else { return UITableViewCell() }
        cell.lblCourierName.text = courierListModel?.data[indexPath.row].couriername
        cell.lblPrice.text = courierListModel?.data[indexPath.row].otherstatefee
        
        return cell

       }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
   
    
    
    
    
    


    func orderAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        
        NetworkManager.shared.callingHttpRequest(api: .courierlist(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.courierListModel = CourierModel(json : jsonResult)
            self.setUpTableView()
        }
    }
    
    func setUpTableView() {
        courierTable.delegate = self
        courierTable.dataSource = self
        courierTable.reloadData()
    }
}
