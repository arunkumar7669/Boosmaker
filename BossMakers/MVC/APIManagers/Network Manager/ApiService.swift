//
//  NetworkManager.swift
//  Project Name: PoundIT
//
//  Created by Rakesh Sharma on 15/04/19.
//
//  Copyright © 2019 Rakesh Sharma. All rights reserved.
//


import Foundation
import Moya
import Alamofire
import SwiftyJSON
import SwiftMessages
import SwiftUI


enum ApiService {
    case userRegistration(param: [String: Any])
    
    case login(param: [String: Any])
    case category(param: [String:Any])
    case bannerHome(param: [String: Any])
    case brandlisting(param: [String: Any])
    case countryList(param:[String:Any])
    case stateList(param:[String:Any])
    case cityList(param:[String:Any])
    case catalogueListing(param: [String:Any])
    case catelogDetails(param: [String: Any])
    case orderListing(param: [String:Any])
    case checkout(param:[String:Any])
    case orderDetails(param: [String: Any])
    case subCategory(param: [String: Any])
    case bannerSubCategory(param:[String:Any])
    case bannerCategoryScnd(param:[String:Any])
    case courierlist(param:[String:Any])
    case editDeliveryAddress(param: [String:Any])
    case adddeliveryaddress(param:[String:Any])
    case deliveryaddresslist(param:[String:Any])
    case pincodeCheck(param:[String:Any])
    case productValue(param:[String:Any])
    case productAttribute(param: [String:Any])
    case productType(param: [String:Any])
    case reviewByCustomer(param: [String:Any])
    case reviewByProduct(param: [String:Any])
    case otpVerify(param: [String:Any])
    
    
    
    
   
    
    case labelList
    case paymentreceiptpdf(param: [String: Any])
    
    case venderDetails(id: String)
    case forgetPassword(param: [String: Any])
    
    case editUserProfile(param: [String: Any])
        //, data: Data, fileTypeKey: String, fileNameWithExtension: String, mimeType: String)
    case logout(param: [String:Any])
    //Vender's API.
    case callconnectotovendor(param: [String:Any])
    
    
    case getInvoice(param: [String:Any])
    case invoiceSeviceStatus(param: [String:Any])
    
    
    case serviceTimeList

    /// User's API.
    case makePayment(param:[String:Any])
    case getNotification(param:[String:Any])
    case notificationList
    
    case addReview(param:[String:Any])
    
    
    case getDocument
    
    case chatDetailDelete(param: [String:Any])
    case blockUser(param: [String:Any])
    case countChat
    case didNo(param: [String:Any])
    
    case getMandoobDetails
    case guestLogin(param : [String:Any])
    case callStatus(param : [String:Any])
    case requestedBymandoob(param : [String:Any])
    case callhistory(param : [String:Any])
    case getReport(param : [String:Any])
    case chatListDelete(param : [String:Any])
    case deleteNotification(param : [String:Any])
    case documentdelete(param : [String:Any])
    case selectdeviceLanguage(param : [String:Any])
    
}

extension ApiService: TargetType {
    var baseURL: URL {
       
        switch self {
            ///For didNo Diffrent API.
        case .didNo:
            return URL(string: ServiceUrls.baseUrlDidNo)!
        default:
            return URL(string: ServiceUrls.baseUrl)!
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "app-login"
        case .category:
            return "category-list"
        case .bannerHome:
            return "banner/listing"
        case .brandlisting:
            return "brand-listing"
        case .userRegistration:
            return "add/customer"
        case .countryList:
            return "get_country_list"
        case .stateList:
            return "get_state_list"
        case .cityList:
            return "get_city_list"
        case .catalogueListing:
            return "all/catalogue/listing"
        case .catelogDetails:
            return "filter/catalogue/listing"
        case .orderListing:
            return "detaibycid"
        case .checkout:
            return  "order"
        case .orderDetails:
            return "orderdetails"
        case .subCategory:
            return "sub-category-list"
        case .bannerSubCategory:
            return "banner/listing"
        case .bannerCategoryScnd:
            return "banner/list_second"
        case .courierlist:
            return "Courierlist"
        case .adddeliveryaddress:
            return "add_delivery_address"
        case .editDeliveryAddress:
            return "edit_delivery_address"
        case .deliveryaddresslist:
            return "delivery_address_list"
        case .pincodeCheck:
            return "pincode/check"
        case .productValue:
            return "product/value"
        case .productType:
            return "product/type"
        case .productAttribute:
            return "product_attribute"
        case .reviewByProduct:
            return  "reviewbyproid"
        case .reviewByCustomer:
            return  "reviewbycusid"
        case .otpVerify:
            return "pin"
        
            
        
           
            
            
            
        case .documentdelete:
            return "document_delete"
        case .chatListDelete:
            return "chatListDelete"
        
        case .forgetPassword:
            return "forgotPassword"
        
        case .deleteNotification:
            return "deleteNotification"
        case .callStatus:
            return "callStatus"
        case .paymentreceiptpdf:
            return "payment-receipt-pdf"
        case .requestedBymandoob:
            return "requestedBymandoob"
        case .callhistory:
            return "callhistory"
        case .getReport:
            return "getReport"
        case .selectdeviceLanguage:
            return "select-device-Language"
        
            
        case .labelList:
             return "\(ServiceUrls.GET_LABLELIST)"
         case .countChat:
             return "\(ServiceUrls.COUNTCHAT)"
         case .getMandoobDetails:
             return "\(ServiceUrls.GETMANDOOPDETAILS)"
            
        case .logout(_):
            return "\(ServiceUrls.LOGOUT)"
        
        case .venderDetails(_):
            return "\(ServiceUrls.GET_VENDER_DETAILS)"
        case .editUserProfile(_):
            return "\(ServiceUrls.EDIT_PROFILE)"
        case .callconnectotovendor(_):
            return "\(ServiceUrls.CALLTOVENDER)"
        
       
        case .getInvoice( _):
            return "\(ServiceUrls.GETINVOICE)"
        case .makePayment( _):
            return "\(ServiceUrls.MAKEPAYMENT)"
        case .getNotification(_ ):
            return "\(ServiceUrls.GETNOTIFICATION)"
        case .notificationList:
            return "\(ServiceUrls.NOTIFICATIONLIST)"
        
        case .addReview( _):
            return "\(ServiceUrls.ADDREVIEW)"
        case .invoiceSeviceStatus( _):
            return "\(ServiceUrls.INVOICESERVICESTATUS)"
        
        
       
        
        case .getDocument:
            return "\(ServiceUrls.GETDOCUMENT)"
       
        case .serviceTimeList:
            return "\(ServiceUrls.GETSERVICETIMELIST)"
       
        case .chatDetailDelete(_):
            return "\(ServiceUrls.CHATDETAILDELETE)"
        case .blockUser(_):
            return "\(ServiceUrls.BLOCKUSER)"
            case .didNo(_):
                return "\(ServiceUrls.DIDNO)"
        
        case .guestLogin(_):
            return "\(ServiceUrls.GUESTLOGIN)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .labelList, .notificationList , .getDocument , .serviceTimeList, .countChat,.didNo, .paymentreceiptpdf :
            return .get
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case  .labelList, .notificationList , .getDocument, .serviceTimeList, .countChat, .getMandoobDetails:
            return .requestPlain
            
        case  .bannerSubCategory(let param), .stateList(let param), .cityList(let param), .countryList(let param), .selectdeviceLanguage(let param), .documentdelete(let param), .deleteNotification(let param), .chatListDelete(let param), .bannerHome(let param), .getReport(let param), .callhistory(let param), .requestedBymandoob(let param), .callStatus(let param), .subCategory(let param), .forgetPassword(let param), .login(let param), .catelogDetails(let param), .userRegistration(let param), .brandlisting(let param), .callconnectotovendor(let param), .catalogueListing(param: let param), .productAttribute(param: let param), .getInvoice(param: let param), .makePayment(param: let param), .pincodeCheck(param: let param),
              .getNotification(param: let param), .bannerCategoryScnd(param: let param), .addReview(param: let param), .invoiceSeviceStatus(param: let param), .orderListing(param: let param), .category(param: let param), .reviewByCustomer(param: let param), .productType(param: let param), .productValue(param: let param), .checkout(param: let param), .editUserProfile(param: let param), .editDeliveryAddress(param: let param), .adddeliveryaddress(param: let param), .chatDetailDelete(param: let param), .blockUser(param: let param), .courierlist(param: let param), .deliveryaddresslist(param: let param), .logout(param: let param), .otpVerify(param: let param), .guestLogin(param: let param), .reviewByProduct(param: let param), .orderDetails(param: let param):
            
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            ///Get with Params .DID.
        case .didNo(param: let param):
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
            
       // case .categoryDetails(let id):
         //   return .requestParameters(parameters: ["id" : id], encoding: URLEncoding.queryString)
        case .venderDetails(let id):
            return .requestParameters(parameters: ["id": id], encoding: JSONEncoding.default)
         case  .paymentreceiptpdf(let param):
            return .requestParameters(parameters: param, encoding:URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        var header = [String: String]()
                    header["Content-Type"] = "application/json"
//                    header["Authorization"] = "Bearer " + Defaults().userToken
//                    if Defaults().language == "ar" {
//                        header["X-Localization"] = "ar"
//                    } else {
//                        header["X-Localization"] = "en"
//                    }
//                     header["token"] = Defaults().userToken
                    return header
         }
}
