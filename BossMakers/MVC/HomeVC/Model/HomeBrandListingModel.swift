//
//  HomeBrandListingModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 16/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON


struct HomeBrandListingModel {
    var Message: String?
    var Data = [HomeBrandData]()
    var Status: String?

    init(json: JSON) {
        Message = json["Message"].stringValue
        Data = json["Data"].arrayValue.compactMap({ HomeBrandData(json: $0)})
        Status = json["Status"].stringValue
    }
}

struct HomeBrandData {
    var vendorid: String?
    var image: String?
    var status: Int = 0
    var updatedat: String?
    var id: Int = 0
    var createdat: String?
    var brandname: String?

    init(json: JSON) {
        vendorid = json["vendor_id"].stringValue
        image = json["image"].stringValue
        status = json["status"].intValue
        updatedat = json["updated_at"].stringValue
        id = json["id"].intValue
        createdat = json["created_at"].stringValue
        brandname = json["brand_name"].stringValue
    }
}
