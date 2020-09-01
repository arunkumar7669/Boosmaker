//
//  BrandListVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 19/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class BrandListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var brandListTable: UITableView!
    
    var brandlistingModelObj  : HomeBrandListingModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       brandListAPI()
        brandListTable.register(BrandListTVC.nib, forCellReuseIdentifier: BrandListTVC.identifier)
    }
    
        func brandListAPI(){
               var parameters = [String: Any]()
               parameters["API_KEY"] = Defaults().apiKey
               NetworkManager.shared.callingHttpRequest(api: .brandlisting(param: parameters)) { (isSuccess, result) in
                          guard let jsonResult = result else {
                            return }
                self.brandlistingModelObj = HomeBrandListingModel(json : jsonResult)
                self.setUpTableView()
           }
           }
    
    func setUpTableView() {
         brandListTable.delegate = self
         brandListTable.dataSource = self
         brandListTable.reloadData()
    }
    

    @IBAction func bGBtnTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        
    }
    
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return brandlistingModelObj?.Data.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return 70
            
        }
       
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
                guard let cell = tableView.dequeueReusableCell(withIdentifier: BrandListTVC.identifier) as? BrandListTVC else { return UITableViewCell() }
            
            cell.lblBrandName.text = brandlistingModelObj?.Data[indexPath.row].brandname
            
                
                return cell
            
        }
    }
    


