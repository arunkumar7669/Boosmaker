//
//  UserDefaults.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 04/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation

class Defaults {
    enum Keys: String {
        case language
        case userEmail
        case tabSelectedIndex
        case userLogedIn
        case userName
        case userPhone
        case phoneNumberCalle
        case userToken
        case userId
        case userCallid
        case userAddress
        case userType
        case image
        case deviceToken
        case isFromChat
        case isOnlineSwitch
        case didNo
        case countryCode
        case guestID
        case isPhoneNumberVerified
        case apiKey
        //case catIdC
    }
    
    var tabSelectedIndex:Int {
        get {
            return UserDefaults.standard.object(forKey: Keys.tabSelectedIndex.rawValue) as? Int ?? 2
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.tabSelectedIndex.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var countryCode:String {
        get {
            return UserDefaults.standard.object(forKey: Keys.countryCode.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.countryCode.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    var apiKey:String {
        get {
            return UserDefaults.standard.object(forKey: Keys.apiKey.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.apiKey.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var isPhoneNumberVerified:String {
        get {
            return UserDefaults.standard.object(forKey: Keys.isPhoneNumberVerified.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.isPhoneNumberVerified.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var deviceToken: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.deviceToken.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.deviceToken.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var didNo: String {
    get {
        return UserDefaults.standard.object(forKey: Keys.didNo.rawValue) as? String ?? ""
       }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.didNo.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var isFromChat: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.isFromChat.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.isFromChat.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var language: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.language.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.language.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    var image:String{
        get {
          return UserDefaults.standard.object(forKey: Keys.image.rawValue) as?
            String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.image.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var userType: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.userType.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.userType.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var guestID: String {
           get {
               return UserDefaults.standard.object(forKey: Keys.guestID.rawValue) as? String ?? ""
           }
           set (newValue) {
               UserDefaults.standard.set(newValue, forKey: Keys.guestID.rawValue)
               UserDefaults.standard.synchronize()
           }
       }
    
    var userLogedIn: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.userLogedIn.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.userLogedIn.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var userName: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.userName.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.userName.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    var userEmail: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.userEmail.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.userEmail.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    var userPhone: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.userPhone.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.userPhone.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var phoneNumberCalle: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.phoneNumberCalle.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.phoneNumberCalle.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var userToken: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.userToken.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.userToken.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    var userId: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.userId.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.userId.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    var userCallid: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.userCallid.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.userCallid.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
//    var catIdC: String {
//        get {
//            return UserDefaults.standard.object(forKey: Keys.catIdC.rawValue) as? String ?? ""
//        }
//        set (newValue) {
//            UserDefaults.standard.set(newValue, forKey: Keys.catIdC.rawValue)
//            UserDefaults.standard.synchronize()
//        }
//    }
    
    
    
    
    var userAddress: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.userAddress.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.userAddress.rawValue)
        }
    }
    
    var isOnlineSwitch: String {
        get {
            return UserDefaults.standard.object(forKey: Keys.isOnlineSwitch.rawValue) as? String ?? ""
        }
        set (newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.isOnlineSwitch.rawValue)
        }
    }
}
