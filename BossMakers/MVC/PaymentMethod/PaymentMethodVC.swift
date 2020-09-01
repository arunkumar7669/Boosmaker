//
//  PaymentMethodVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class PaymentMethodVC: UIViewController {
    @IBOutlet weak var btnPaytm: UIButton!
    
    @IBOutlet weak var btnBank: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var viewPaytm: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.viewPaytm.isHidden = true
        self.btnSubmit.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnBankTapped(_ sender: Any) {
        self.viewPaytm.isHidden = true
        self.btnSubmit.isHidden = true
        btnPaytm.backgroundColor = Constants.bossBackgroundColor
        btnBank.setTitleColor(Constants.bossBackgroundColor, for: .normal)
        btnPaytm.setTitleColor(.white, for: .normal)
        btnBank.backgroundColor = .white
    }
    
    @IBAction func btnPaytmTapped(_ sender: Any) {
        self.btnSubmit.isHidden = false
        btnPaytm.backgroundColor = .white
        btnBank.setTitleColor(.white, for: .normal)
        btnPaytm.setTitleColor(Constants.bossBackgroundColor, for: .normal)
        btnBank.backgroundColor = Constants.bossBackgroundColor
        self.viewPaytm.isHidden = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
