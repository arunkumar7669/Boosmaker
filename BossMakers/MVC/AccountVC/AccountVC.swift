//
//  AccountVC.swift
//  BossMakers
//
//  Created by Saurabh Gaur on 05/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class AccountVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var accountOptionTable: UITableView!
    
   
    @IBAction func myOrderTapped(_ sender: UIButton) {
     guard  let chatVC = OrdersVC.instantiate(fromAppStoryboard: .Main) as? OrdersVC else { return }
                          self.navigationController?.pushViewController(chatVC, animated: true)
   
    }
    @IBAction func paymentTapped(_ sender: UIButton) {
        guard  let chatVC = PaymentMethodVC.instantiate(fromAppStoryboard: .Main) as? PaymentMethodVC else { return }
                       self.navigationController?.pushViewController(chatVC, animated: true)
        
    }
    
    
    
    @IBAction func btnEditProfileTapped(_ sender: UIButton) {
   
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        userImage?.cornerRadous(userImage)
        lblUserName.text =  Defaults().userName
         let image = UIImage(named: "account-tab-ic")
        userImage.setImage(with: Defaults().image, placeholder: image)
        //userImage.setImage(with: Defaults().image, placeholder: "plahoderimage")
        accountOptionTable.delegate = self
        accountOptionTable.dataSource = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        accountOptionTable.register(profileOptionListTVC.nib, forCellReuseIdentifier: profileOptionListTVC.identifier)
        accountOptionTable.register(LogoutTVC.nib, forCellReuseIdentifier: LogoutTVC.identifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    
    //----tableView
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
       
            return 70
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            switch indexPath.row {
            case 0:
               
                guard  let chatVC = PaymentMethodVC.instantiate(fromAppStoryboard: .Main) as? PaymentMethodVC else { return }
                self.navigationController?.pushViewController(chatVC, animated: true)
                
            case 1:
              
                        logDebug("tap on section = \(indexPath.section) and index = \(indexPath.row)")
                       
                 case 2:
                        guard  let chatVC = MyActivityVC.instantiate(fromAppStoryboard: .Main) as? MyActivityVC else { return }
                        self.navigationController?.pushViewController(chatVC, animated: true)
                case 3:
                
                  let registrationStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                              guard let changePasswordVC = registrationStoryboard.instantiateViewController(withIdentifier: "DefaultSharingVC") as? DefaultSharingVC else { return }
                              //changePasswordVC.modalPresentationStyle = .fullScreen
                              changePasswordVC.providesPresentationContextTransitionStyle = true
                              changePasswordVC.definesPresentationContext = true
                              changePasswordVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                              changePasswordVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                              
                              self.present(changePasswordVC, animated: false, completion: nil)
                case 4:
                
                logDebug("tap on section = \(indexPath.section) and index = \(indexPath.row)")
                case 5:
                
                logDebug("tap on section = \(indexPath.section) and index = \(indexPath.row)")
                case 6:
                
                logDebug("tap on section = \(indexPath.section) and index = \(indexPath.row)")
                
        
                      
                
            default:
                logDebug("tap on section = \(indexPath.section) and index = \(indexPath.row)")
    }
            }

      
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
             
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: profileOptionListTVC.identifier) as? profileOptionListTVC else { return UITableViewCell() }
            cell.lblOption.text = "Bossmakers Pay"
            //let image: UIImage = UIImage(named: "my-refer-earn-ic")!
           // cell.optionImage = UIImageView(image: image)
            

            return cell
            
            case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: profileOptionListTVC.identifier) as? profileOptionListTVC else { return UITableViewCell() }
                cell.lblOption.text = "My Refer and Earn"
            let image: UIImage = UIImage(named: "my-refer-earn-ic")!
            cell.optionImage = UIImageView(image: image)
                       return cell
            
            case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: profileOptionListTVC.identifier) as? profileOptionListTVC else { return UITableViewCell() }
                  cell.lblOption.text = "Recent Shared"
            let image: UIImage = UIImage(named: "recent-shares-ic")!
            cell.optionImage = UIImageView(image: image)
                       return cell
            
            case 3:
             guard let cell = tableView.dequeueReusableCell(withIdentifier: profileOptionListTVC.identifier) as? profileOptionListTVC else { return UITableViewCell() }
                     cell.lblOption.text = "WhatsApp Sharing Setting"
             let image: UIImage = UIImage(named: "whats-sharing-ic")!
             cell.optionImage = UIImageView(image: image)
                       return cell
            case 4:
                        guard let cell = tableView.dequeueReusableCell(withIdentifier: profileOptionListTVC.identifier) as? profileOptionListTVC else { return UITableViewCell() }
                                cell.lblOption.text = "Notifications"
                        let image: UIImage = UIImage(named: "notification-ic")!
                        cell.optionImage = UIImageView(image: image)
                                  return cell
            
            case 5:
             guard let cell = tableView.dequeueReusableCell(withIdentifier: profileOptionListTVC.identifier) as? profileOptionListTVC else { return UITableViewCell() }
                       cell.lblOption.text = "Rate App"
             let image: UIImage = UIImage(named: "rate-app-ic")!
             cell.optionImage = UIImageView(image: image)
                       return cell
            
            case 6:
             guard let cell = tableView.dequeueReusableCell(withIdentifier: profileOptionListTVC.identifier) as? profileOptionListTVC else { return UITableViewCell() }
                       cell.lblOption.text = "Share App"
             let image: UIImage = UIImage(named: "share-app-ic")!
             cell.optionImage = UIImageView(image: image)
                       return cell
            
            
            
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LogoutTVC.identifier) as? LogoutTVC else { return UITableViewCell() }
            
            return cell
            
            
        default:
            let cell = UITableViewCell()
            return cell
        }
        
    }
}
