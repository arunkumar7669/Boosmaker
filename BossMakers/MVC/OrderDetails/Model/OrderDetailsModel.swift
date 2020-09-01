//
//  OrderDetailsModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 29/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct OrderDeatilsModel {
    var message: String?
    var status: String?
    var data = [OrderDeatilsData]()
    var imagepath: String?

    init(json: JSON) {
        message = json["message"].stringValue
        status = json["status"].stringValue
        data = json["data"].arrayValue.compactMap({ OrderDeatilsData(json: $0)})
        imagepath = json["imagepath"].stringValue
    }
}

struct OrderDeatilsData {
    var OrderReasonforRefund: String?
    var subtotalamount: String?
    var customerlandmark: String?
    var supplierid: String?
    var OrderExpireTime: String?
    var OrderRefundDate: String?
    var Orderverifystatus: Int = 0
    var paymenttransactiondate: String?
    var OrderReturnDeliveredDate: String?
    var shippingdate: String?
    var customerreturnrequeststatus: Int = 0
    var discountprice: String?
    var createdat: String?
    var shippingstatus: Int = 0
    var customercity: String?
    var customerzipcode: String?
    var orderrequireddate: String?
    var gsttax: String?
    var couponprice: String?
    var sellerid: Int = 0
    var updatedat: String?
    var productname: String?
    var orderdatecheck: String?
    var OrderReturnAWB: String?
    var id: Int = 0
    var paymenttransactionnumber: String?
    var totalorderamount: String?
    var productdiscount: String?
    var courierid: Int = 0
    var OrderApprovestatus: Int = 0
    var totalprice: String?
    var productid: Int = 0
    var ordertime: String?
    var productqty: String?
    var suborderid: String?
    var customeraddress: String?
    var customercashcommission: String?
    var orderdatetime: String?
    var deliverycharge: String?
    var ordershippeddate: String?
    var ordernumber: String?
    var productprice: String?
    var OrderExpireDate: String?
    var productvariantid: Int = 0
    var OrderShippingAWB: String?
    var orderdate: String?
    var customrname: String?
    var customerphone: String?
    var OrderReasonforReturn: String?
    var shippingtime: String?
    var shippingstatuscomment: String?
    var customercomment: String?
    var OrderRefundAmount: String?
    var productimage: String?
    var couponcode: String?
    var customerid: Int = 0
    var customeremail: String?
    var paymentmethod: String?
    var orderstatus: Int = 0

    init(json: JSON) {
        OrderReasonforRefund = json["Order_Reason_for_Refund"].stringValue
        subtotalamount = json["subtotal_amount"].stringValue
        customerlandmark = json["customer_landmark"].stringValue
        supplierid = json["supplier_id"].stringValue
        OrderExpireTime = json["Order_Expire_Time"].stringValue
        OrderRefundDate = json["Order_Refund_Date"].stringValue
        Orderverifystatus = json["Order_verify_status"].intValue
        paymenttransactiondate = json["payment_transaction_date"].stringValue
        OrderReturnDeliveredDate = json["Order_Return_Delivered_Date"].stringValue
        shippingdate = json["shipping_date"].stringValue
        customerreturnrequeststatus = json["customer_return_request_status"].intValue
        discountprice = json["discount_price"].stringValue
        createdat = json["created_at"].stringValue
        shippingstatus = json["shipping_status"].intValue
        customercity = json["customer_city"].stringValue
        customerzipcode = json["customer_zipcode"].stringValue
        orderrequireddate = json["order_required_date"].stringValue
        gsttax = json["gst_tax"].stringValue
        couponprice = json["coupon_price"].stringValue
        sellerid = json["seller_id"].intValue
        updatedat = json["updated_at"].stringValue
        productname = json["product_name"].stringValue
        orderdatecheck = json["order_date_check"].stringValue
        OrderReturnAWB = json["Order_Return_AWB"].stringValue
        id = json["id"].intValue
        paymenttransactionnumber = json["payment_transaction_number"].stringValue
        totalorderamount = json["total_order_amount"].stringValue
        productdiscount = json["product_discount"].stringValue
        courierid = json["courier_id"].intValue
        OrderApprovestatus = json["Order_Approve_status"].intValue
        totalprice = json["totalprice"].stringValue
        productid = json["product_id"].intValue
        ordertime = json["order_time"].stringValue
        productqty = json["product_qty"].stringValue
        suborderid = json["sub_order_id"].stringValue
        customeraddress = json["customer_address"].stringValue
        customercashcommission = json["customer_cash_commission"].stringValue
        orderdatetime = json["order_date_time"].stringValue
        deliverycharge = json["delivery_charge"].stringValue
        ordershippeddate = json["order_shipped_date"].stringValue
        ordernumber = json["order_number"].stringValue
        productprice = json["product_price"].stringValue
        OrderExpireDate = json["Order_Expire_Date"].stringValue
        productvariantid = json["product_variant_id"].intValue
        OrderShippingAWB = json["Order_Shipping_AWB"].stringValue
        orderdate = json["order_date"].stringValue
        customrname = json["customr_name"].stringValue
        customerphone = json["customer_phone"].stringValue
        OrderReasonforReturn = json["Order_Reason_for_Return"].stringValue
        shippingtime = json["shipping_time"].stringValue
        shippingstatuscomment = json["shipping_status_comment"].stringValue
        customercomment = json["customer_comment"].stringValue
        OrderRefundAmount = json["Order_Refund_Amount"].stringValue
        productimage = json["product_image"].stringValue
        couponcode = json["coupon_code"].stringValue
        customerid = json["customer_id"].intValue
        customeremail = json["customer_email"].stringValue
        paymentmethod = json["payment_method"].stringValue
        orderstatus = json["order_status"].intValue
    }
}

