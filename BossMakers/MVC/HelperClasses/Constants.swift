//
//  Constants.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 04/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation
import UIKit

enum EnvironmentType {
    case userApp, venderApp
}

var guestFlowComingFrom: ComingFrom?

enum ComingFrom {
    case profil, chat
    case callLog
    case booking
    case chats
    case mandooblistChat
    case mandooblistCall
    case mandoobprofileChat
    case mandoobprofileCall
    case mandoobprofileAddComment

}

struct Constants {
    static let bossBackgroundColor = UIColor(hexString: "E53958")
    static let appThemeColor = UIColor(red:0.3, green:0.48, blue:0.95, alpha:1)
    static let apptabColor =  UIColor(red:0, green:0.28, blue:0.56, alpha:1)
    static let appembassyColor =  UIColor(red:0, green:0.28, blue:0.56, alpha:0.4)
    
    static let vendorSearchColor = UIColor(hexString: "0F60B4")
    static let tabShadow = UIColor(red:0.0, green:0.18, blue:0.36, alpha:1)
    static let searchtext = UIColor(red:1, green:1, blue:1, alpha:0.66)

    static let theamcolorhexa = UIColor(hexString: "01478F")
    
    static let appThemeColorHexString = UIColor(hexString: "4E6DFB")
    static let textColorHexString = UIColor(hexString: "333A42")
    static let textBackgroundColor = UIColor.clear
    static let theambackCustom = UIColor(hexString: "EEF1F3")
   //
    
    static let appGradientColorfirst =  UIColor(hexString: "013f80")//UIColor(red:1/255, green:63/255, blue:128/255, alpha:1)
    
    static let appGradientColorSecound = UIColor(hexString: "024f9f")//UIColor(red:2/255, green:79/255, blue:159/255, alpha:1)
    static let selectmaximumImage = 5
    
    #if USER
    static let environment: EnvironmentType = .userApp
    #else
    static let environment: EnvironmentType = .venderApp
    #endif
    
}
enum CustomFont: String {
    case regular = "AbrilFatface-Regular"
    case medium = "CircularPro-Medium"
    case black = "CircularPro-Black"
    case bold = "CircularPro-Bold"
    case book = "CircularPro-Book"
}

//MARK:- Screen Size

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

//MARK:- Api Urls and methods
struct ServiceUrls {
//    for testing server

 
    
    static let baseUrl = "http://appylance.com/bossmakers/api/"


//    for development
   
    static let baseUrlDidNo = "http://37.34.202.215:2180/"
    static let imageBaseUrl =  "http://appylance.com/bossmakers/"
  
    static let GET_LABLELIST = "labelList"
    static let POST_CATEGORY = "categoryList"
    static let GET_VENDERS = "vendors"
    static let EDIT_PROFILE = "editProfile"
    static let GET_VENDER_DETAILS = "vendorDetails"
    static let USER_REGISTRATION = "register"
    static let VERIFY_OTP = "verifyOtp"
    static let LOGIN = "login"
    static let LOGOUT = "logout"
    static let CALLTOVENDER = "callconnectotovendor"
    static let NEWLEAD = "newlead"
    static let CREATEINVOICE = "createInvoice"
    static let GETINVOICE = "getInvoice"
    static let MAKEPAYMENT = "savePaymentDetails"
    static let GETNOTIFICATION = "getNotification"
    static let NOTIFICATIONLIST = "notificationList"
    static let FORGOTPASSWORD = "forgotPassword"
    static let INVOICEDETAIL = "invoiceDetails"
    static let ADDREVIEW = "addReview"
    static let INVOICESERVICESTATUS = "invoice/sevice/status"
    static let ONLINESTATUS = "onlineStatus"
    static let EDITINVOICE = "editinvoice"
    static let MYBOOKING = "myBooking"
    static let GETPENDINGBOOKING = "getPendingBooking"
    static let GETLISTINGCHAT = "listingChat"
    static let CONVERSATIONDETAILPOST = "conversationDetails"
    static let SENDCHATPOST = "sendChat"
    static let UPDATEDPAYMENTSTATUS = "Ottu_Update_PaymentStatus"
    static let GETDOCUMENT = "getDocument"
    static let ADDMEDIA = "addMedia"
    static let GETSERVICETIMELIST = "serviceTimeList"
    static let CANCELPENDINGBOOKING = "cancelPendingBooking"
    static let CHATDETAILDELETE = "chatDetailDelete"
    static let BLOCKUSER = "blockUser"
    static let COUNTCHAT = "countChat"
    static let DIDNO = "Dandoop_Calling.php"
    static let MANDOOBWISECATRGORY = "mandoobWiseCategory"
    static let GETMANDOOPDETAILS = "getMandoobDetails"
    static let GUESTLOGIN  = "guestLogin"
   
}

