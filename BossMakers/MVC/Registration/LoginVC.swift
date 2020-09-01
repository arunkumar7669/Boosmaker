//
//  LoginVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 08/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet var  txtInputArr         : [UITextField]!
    @IBOutlet weak var mobileNumberTF  : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnforgotPinTapped(_ sender: Any) {
        let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC ?? UIViewController()
        
        self.navigationController?.pushViewController(mainView, animated: true)
    }
    
    @IBAction func btnLoginTapped(_ sender: Any) {
         view.endEditing(true)
        guard let phoneNum = mobileNumberTF.checkValidation(validation: .phone) else { return }
        var flagEmpty = false
        for textFields in self.txtInputArr where textFields.text?.isEmptyText() == true {
            flagEmpty = true
            break
        }

        if flagEmpty {
//            self.showError(message: "Please Enter m-Pin")
//            return
        }
        var otp = ""
        for i in 0...txtInputArr.count - 1{
            otp = otp + (txtInputArr[i].text ?? "")
        }

        NetworkManager.shared.callingHttpRequest(api: .login(param: ["API_KEY": Defaults().apiKey, "phone": phoneNum, "m_pin": otp])) { (isSuccess, result) in
            let statusCode = result?["Status"]

            if statusCode == "SUCCESS" {
                let dataDic = result?["Data"].dictionaryObject
                let userId = dataDic?["id"] as? Int ?? 0
                let userType = dataDic?["user_type"] as? Int ?? 0
                let didNum = dataDic?["did_no"] as? Int ?? 0
                let countryCode = dataDic?["country_code"] as? Int ?? 0

                Defaults().didNo = "\(didNum)"
                Defaults().countryCode = "\(countryCode)"
                Defaults().userId = "\(userId)"
                Defaults().userLogedIn = "true"
                Defaults().userPhone = dataDic?["phone"] as? String ?? ""
                Defaults().userEmail = dataDic?["email"] as? String ?? ""
                Defaults().image = dataDic?["image"] as? String ?? ""
                Defaults().userName = dataDic?["name"] as? String ?? ""

                
                let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rootTabbar") as? UITabBarController ?? UITabBarController()
                mainView.selectedIndex = 0
                self.navigationController?.pushViewController(mainView, animated: true)
            }else{
                self.showError(message: "Please enter correct login details")
            }

        }
    }
    
    
    
    @IBAction func btnFacebookTapped(_ sender: Any) {
        
    }
    
    @IBOutlet weak var btnGoogleTapped: UILabel!
    
    
    @IBAction func btnRegisterTapped(_ sender: Any) {
        let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationVC ?? UIViewController()
        
        self.navigationController?.pushViewController(mainView, animated: true)
    }
    
    
    
    
    @IBAction func txtEnterCharectorAction(_ sender : UITextField){
        let text = sender.text
        if text?.count == 1 {
            switch sender {
            case txtInputArr[0]:  txtInputArr[1].becomeFirstResponder()
            case txtInputArr[1]: txtInputArr[2].becomeFirstResponder()
            case txtInputArr[2]: txtInputArr[3].becomeFirstResponder()
            default: txtInputArr[3].resignFirstResponder()
            }
        } else {
            sender.text = nil
            switch sender {
            case txtInputArr[3]: txtInputArr[2].becomeFirstResponder()
            case txtInputArr[2]: txtInputArr[1].becomeFirstResponder()
            case txtInputArr[1]: txtInputArr[0].becomeFirstResponder()
            case txtInputArr[0]: txtInputArr[0].becomeFirstResponder()
            default: break
            }
        }
    }
    
    
    
}
