//
//  CityModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 18/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CityModel {
    var Status: String?
    var Message: String?
    var Error: String?
    var Data = [CityData]()

    init(json: JSON) {
        Status = json["Status"].stringValue
        Message = json["Message"].stringValue
        Error = json["Error"].stringValue
        Data = json["Data"].arrayValue.compactMap({ CityData(json: $0)})
    }
}

struct CityData {
    var status: Int = 0
    var name: String?
    var stateid: Int = 0
    var createddate: String?
    var id: Int = 0

    init(json: JSON) {
        status = json["status"].intValue
        name = json["name"].stringValue
        stateid = json["state_id"].intValue
        createddate = json["created_date"].stringValue
        id = json["id"].intValue
    }
}
