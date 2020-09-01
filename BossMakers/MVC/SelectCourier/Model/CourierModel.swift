//
//  CourierModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON


struct CourierModel {
    var data = [CourierData]()
    var status: String?
    var message: String?

    init(json: JSON) {
        data = json["data"].arrayValue.compactMap({ CourierData(json: $0)})
        status = json["status"].stringValue
        message = json["message"].stringValue
    }
}

struct CourierData {
    var couriername: String?
    var otherstatefee: String?
    var updatedat: String?
    var createdat: String?
    var samecityfee: String?
    var couriericon: String?
    var id: Int = 0
    var status: Int = 0
    var samestatefee: String?

    init(json: JSON) {
        couriername = json["courier_name"].stringValue
        otherstatefee = json["other_state_fee"].stringValue
        updatedat = json["updated_at"].stringValue
        createdat = json["created_at"].stringValue
        samecityfee = json["same_city_fee"].stringValue
        couriericon = json["courier_icon"].stringValue
        id = json["id"].intValue
        status = json["status"].intValue
        samestatefee = json["same_state_fee"].stringValue
    }
}

