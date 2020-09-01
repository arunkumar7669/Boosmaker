//
//  ForgotPasswordVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 14/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var otpTF  : UITextField!
    
   
    
    @IBAction func btnSendOTP(_ sender: Any) {
        NetworkManager.shared.callingHttpRequest(api: .otpVerify(param: ["API_KEY": Defaults().apiKey, "phone": otpTF.text])) { (isSuccess, result) in
            guard let jsonResult = result else {
            return }
            let statusCode = jsonResult["status"].stringValue

                  if statusCode == "1" {
                    self.showSuccess(message: "OTP Send to register mobile number succesfully")
                    let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC ?? UIViewController()
                    
                    self.navigationController?.pushViewController(mainView, animated: true)
                  }else{
                    self.showError(message: "Something went wrong please try again")
            }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

   

}
