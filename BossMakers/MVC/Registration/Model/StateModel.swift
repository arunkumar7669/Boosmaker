//
//  StateModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 18/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct StateModel {
    var Status: String?
    var Error: String?
    var Data = [StateData]()
    var Message: String?

    init(json: JSON) {
        Status = json["Status"].stringValue
        Error = json["Error"].stringValue
        Data = json["Data"].arrayValue.compactMap({ StateData(json: $0)})
        Message = json["Message"].stringValue
    }
}

struct StateData {
    var statename: String?
    var status: Int = 0
    var id: Int = 0
    var createddate: String?
    var countryid: Int = 0

    init(json: JSON) {
        statename = json["state_name"].stringValue
        status = json["status"].intValue
        id = json["id"].intValue
        createddate = json["created_date"].stringValue
        countryid = json["country_id"].intValue
    }
}

