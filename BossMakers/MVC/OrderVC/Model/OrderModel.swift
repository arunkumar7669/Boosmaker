//
//  OrderModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 17/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct OrderListModel {
    var Message: String?
    var Status: String?
    var Data: OrderListData?
     var imagepath: String?

    init(json: JSON) {
        Message = json["Message"].stringValue
        Status = json["Status"].stringValue
        Data = OrderListData(json: json["Data"])
        imagepath = json["imagepath"].stringValue
    }
}

struct OrderListData {
    var orderDetail = [Order_Detail]()
    var customerinfo = [Customer_info]()

    init(json: JSON) {
        orderDetail = json["order_Detail"].arrayValue.compactMap({ Order_Detail(json: $0)})
        customerinfo = json["customer_info"].arrayValue.compactMap({ Customer_info(json: $0)})
    }
}

struct Order_Detail {
    var productImage : String?
    var OrderExpireDate: String?
    var customercashcommission: String?
    var totalorderamount: String?
    var OrderReasonforRefund: String?
    var ordershippeddate: String?
    var customerid: Int = 0
    var paymenttransactiondate: String?
    var customeremail: String?
    var OrderReasonforReturn: String?
    var ordertime: String?
    var customerzipcode: String?
    var discountprice: String?
    var Orderverifystatus: Int = 0
    var paymentmethod: String?
    var OrderExpireTime: String?
    var customeraddress: String?
    var customerlandmark: String?
    var couponcode: String?
    var customercity: String?
    var orderdate: String?
    var id: Int = 0
    var supplierid: String?
    var createdat: String?
    var OrderRefundAmount: String?
    var OrderRefundDate: String?
    var orderdatetime: String?
    var paymenttransactionnumber: String?
    var customercomment: String?
    var gsttax: String?
    var couponprice: String?
    var updatedat: String?
    var orderrequireddate: String?
    var customrname: String?
    var orderstatus: Int = 0
    var courierid: Int = 0
    var customerphone: String?
    var ordernumber: String?
    var customerreturnrequeststatus: Int = 0
    var sellerid: Int = 0
    var orderdatecheck: String?
    var subtotalamount: String?
    var OrderShippingAWB: String?
    var deliverycharge: String?
    var OrderApprovestatus: Int = 0
    var OrderReturnAWB: String?
    var OrderReturnDeliveredDate: String?

    init(json: JSON) {
        productImage = json["product_image"].stringValue
        OrderExpireDate = json["Order_Expire_Date"].stringValue
        customercashcommission = json["customer_cash_commission"].stringValue
        totalorderamount = json["total_order_amount"].stringValue
        OrderReasonforRefund = json["Order_Reason_for_Refund"].stringValue
        ordershippeddate = json["order_shipped_date"].stringValue
        customerid = json["customer_id"].intValue
        paymenttransactiondate = json["payment_transaction_date"].stringValue
        customeremail = json["customer_email"].stringValue
        OrderReasonforReturn = json["Order_Reason_for_Return"].stringValue
        ordertime = json["order_time"].stringValue
        customerzipcode = json["customer_zipcode"].stringValue
        discountprice = json["discount_price"].stringValue
        Orderverifystatus = json["Order_verify_status"].intValue
        paymentmethod = json["payment_method"].stringValue
        OrderExpireTime = json["Order_Expire_Time"].stringValue
        customeraddress = json["customer_address"].stringValue
        customerlandmark = json["customer_landmark"].stringValue
        couponcode = json["coupon_code"].stringValue
        customercity = json["customer_city"].stringValue
        orderdate = json["order_date"].stringValue
        id = json["id"].intValue
        supplierid = json["supplier_id"].stringValue
        createdat = json["created_at"].stringValue
        OrderRefundAmount = json["Order_Refund_Amount"].stringValue
        OrderRefundDate = json["Order_Refund_Date"].stringValue
        orderdatetime = json["order_date_time"].stringValue
        paymenttransactionnumber = json["payment_transaction_number"].stringValue
        customercomment = json["customer_comment"].stringValue
        gsttax = json["gst_tax"].stringValue
        couponprice = json["coupon_price"].stringValue
        updatedat = json["updated_at"].stringValue
        orderrequireddate = json["order_required_date"].stringValue
        customrname = json["customr_name"].stringValue
        orderstatus = json["order_status"].intValue
        courierid = json["courier_id"].intValue
        customerphone = json["customer_phone"].stringValue
        ordernumber = json["order_number"].stringValue
        customerreturnrequeststatus = json["customer_return_request_status"].intValue
        sellerid = json["seller_id"].intValue
        orderdatecheck = json["order_date_check"].stringValue
        subtotalamount = json["subtotal_amount"].stringValue
        OrderShippingAWB = json["Order_Shipping_AWB"].stringValue
        deliverycharge = json["delivery_charge"].stringValue
        OrderApprovestatus = json["Order_Approve_status"].intValue
        OrderReturnAWB = json["Order_Return_AWB"].stringValue
        OrderReturnDeliveredDate = json["Order_Return_Delivered_Date"].stringValue
    }
}

struct Customer_info {
    var image: String?
    var name: String?
    var businessname: String?
    var ip: String?
    var zipcode: String?
    var mpin: Int = 0
    var loc: String?
    var status: String?
    var motp: Int = 0
    var amount: String?
    var company: String?
    var orderid: String?
    var phone: String?
    var postbox: String?
    var id: Int = 0
    var region: String?
    var email: String?
    var dob: String?
    var accountseourl: String?
    var createdat: String?
    var updatedat: String?
    var companyseourl: String?
    var stateid: Int = 0
    var address: String?
    var gender: String?
    var mverfiy: String?
    var deviceplatform: String?
    var cityid: Int = 0
    var deviceid: String?
    var countryid: Int = 0
    var purchasedate: String?

    init(json: JSON) {
        image = json["image"].stringValue
        name = json["name"].stringValue
        businessname = json["business_name"].stringValue
        ip = json["ip"].stringValue
        zipcode = json["zip_code"].stringValue
        mpin = json["m_pin"].intValue
        loc = json["loc"].stringValue
        status = json["status"].stringValue
        motp = json["m_otp"].intValue
        amount = json["amount"].stringValue
        company = json["company"].stringValue
        orderid = json["order_id"].stringValue
        phone = json["phone"].stringValue
        postbox = json["postbox"].stringValue
        id = json["id"].intValue
        region = json["region"].stringValue
        email = json["email"].stringValue
        dob = json["dob"].stringValue
        accountseourl = json["account_seo_url"].stringValue
        createdat = json["created_at"].stringValue
        updatedat = json["updated_at"].stringValue
        companyseourl = json["company_seo_url"].stringValue
        stateid = json["state_id"].intValue
        address = json["address"].stringValue
        gender = json["gender"].stringValue
        mverfiy = json["m_verfiy"].stringValue
        deviceplatform = json["device_platform"].stringValue
        cityid = json["city_id"].intValue
        deviceid = json["device_id"].stringValue
        countryid = json["country_id"].intValue
        purchasedate = json["purchase_date"].stringValue
    }
}
