//
//  CountryModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 18/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CountryModel {
    var Error: String?
    var Data = [CountryData]()
    var Status: String?
    var Message: String?

    init(json: JSON) {
        Error = json["Error"].stringValue
        Data = json["Data"].arrayValue.compactMap({ CountryData(json: $0)})
        Status = json["Status"].stringValue
        Message = json["Message"].stringValue
    }
}

struct CountryData {
    var sortname: String?
    var id: Int = 0
    var phonecode: Int = 0
    var name: String?
    var createddate: String?
    var status: Int = 0

    init(json: JSON) {
        sortname = json["sortname"].stringValue
        id = json["id"].intValue
        phonecode = json["phonecode"].intValue
        name = json["name"].stringValue
        createddate = json["created_date"].stringValue
        status = json["status"].intValue
    }
}

