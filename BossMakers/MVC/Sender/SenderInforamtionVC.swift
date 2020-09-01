//
//  SenderInforamtionVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 20/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class SenderInforamtionVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBOutlet weak var senderInfoTable: UITableView!
    
    @IBAction func btnSelectProcedd(_ sender: UIButton) {
        
    }
    @IBAction func btnSenderAdd(_ sender: UIButton) {
        
        let registrationStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let changePasswordVC = registrationStoryboard.instantiateViewController(withIdentifier: "AddSenderVC") as? AddSenderVC else { return }
        //changePasswordVC.modalPresentationStyle = .fullScreen
        changePasswordVC.providesPresentationContextTransitionStyle = true
        changePasswordVC.definesPresentationContext = true
        changePasswordVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        changePasswordVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        self.navigationController?.present(changePasswordVC, animated: false, completion: nil)
        
        
        
        
       
                
        
    }
    
    @IBOutlet weak var btnAddSenderTapped: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpTableView()
       senderInfoTable.register(SenderInformationTVC.nib, forCellReuseIdentifier: SenderInformationTVC.identifier)
    }
    
    func setUpTableView() {
        senderInfoTable.delegate = self
        senderInfoTable.dataSource = self
        senderInfoTable.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SenderInformationTVC.identifier) as? SenderInformationTVC else { return UITableViewCell() }
            
            
            return cell
            
       
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    


}
