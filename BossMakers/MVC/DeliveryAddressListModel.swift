//
//  DeliveryAddressListModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct DeliveryAddressListModel {
    var Error: String?
    var Message: String?
    var Status: String?
    var Data = [DeliveryAddressData]()

    init(json: JSON) {
        Error = json["Error"].stringValue
        Message = json["Message"].stringValue
        Status = json["Status"].stringValue
        Data = json["Data"].arrayValue.compactMap({ DeliveryAddressData(json: $0)})
    }
}

struct DeliveryAddressData {
    var city: String?
    var address: String?
    var updatedat: String?
    var pincode: String?
    var status: Int = 0
    var customerid: Int = 0
    var state: String?
    var id: Int = 0
    var landmark: String?

    init(json: JSON) {
        city = json["city"].stringValue
        address = json["address"].stringValue
        updatedat = json["updated_at"].stringValue
        pincode = json["pin_code"].stringValue
        status = json["status"].intValue
        customerid = json["customer_id"].intValue
        state = json["state"].stringValue
        id = json["id"].intValue
        landmark = json["landmark"].stringValue
    }
}

