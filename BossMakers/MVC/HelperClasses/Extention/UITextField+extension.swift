//
//  UITextField+extension.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 04/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation
import UIKit

enum validationType {
    case email
    case name
    case phone
    case password
    case confirmPassword
    case txtViewDesc
    case commonCheck
    case address
    case otpVerification
    case mpin
}
extension UITextField {
   
func addPaddingLeft(_ padding: CGFloat) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
    leftView = paddingView
    leftViewMode = .always
}
    
    func checkValidation(validation: validationType) -> String? {
        
        switch validation {
        case .email:
            guard let email = self.text, !email.isEmpty else {
                self.showError(message: "localization.pleaseEnterEmail" )
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            
            if !email.isValidEmail() {
                self.showError(message: "localization.pleaseEnterAValidEmail" ?? "")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            
            return email
        
        case .name:
            guard let lastName = self.text, !lastName.isEmpty else {
                self.showError(message: "localization.pleaseEnterName")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            
            return lastName
        case .address:
            guard let address = self.text, !address.isEmpty else {
                self.showError(message: "localization.enterEmailAddress")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            return address
        case .txtViewDesc:
            guard let textVDesc = self.text, !textVDesc.isEmpty else {
                self.showError(message: "localization.pleaseFillDescription")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            
            return textVDesc
        case .phone:
            guard let phoneNumber = self.text, !phoneNumber.isEmpty else {
                self.showError(message: "localization.pleaseEnterPhoneNumber")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            
            if phoneNumber.count < 10 || phoneNumber.count > 10 {
                self.showError(message: "localization.phoneNumberMustBe8Digits")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            return phoneNumber
            
            case .otpVerification:
                       guard let otp = self.text, !otp.isEmpty else {
                        self.showError(message: "localization.pleaseEnterOtp")
                           self.becomeFirstResponder()
                           self.shake()
                           return nil
                       }
                       
                       if otp.count < 6 || otp.count > 6 {
                        self.showError(message: "localization.pleaseEnterValidOtp")
                           self.becomeFirstResponder()
                           self.shake()
                           return nil
                       }
                       return otp
            
            case .mpin:
             guard let mpin = self.text, !mpin.isEmpty else {
             self.showError(message: "localization.pleaseEnterOtp")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            
            if mpin.count < 4 || mpin.count > 4 {
             self.showError(message: "localization.pleaseEnterValidOtp")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            return mpin
            
        case .password:
            guard let password = self.text, !password.isEmpty else {
                self.showError(message: "localization.pleaseEnterPassword")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            return password
        case .confirmPassword:
            guard let confirmPassword = self.text, !confirmPassword.isEmpty else {
                self.showError(message: "localization.pleaseEnterConfirmPassword")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            return confirmPassword
        case .commonCheck:
            guard let confirmPassword = self.text, !confirmPassword.isEmpty else {
                self.showError(message: "localization.inputFieldCanNotBeEmplty")
                self.becomeFirstResponder()
                self.shake()
                return nil
            }
            return confirmPassword
        }
    }
}

private var kAssociationKeyMaxLength: Int = 0

extension UITextField {
    
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        
        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        let substring = prospectiveText[..<indexEndOfText]
        text = String(substring)
        
        selectedTextRange = selection
    }
}
