//
//  CategoryListingModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 13/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CategoryListingModel {
    var Status: String?
    var Message: String?
    var imagepath: String?
    var Data = [CategoryData]()

    init(json: JSON) {
        Status = json["Status"].stringValue
        Message = json["Message"].stringValue
        imagepath = json["imagepath"].stringValue
        Data = json["Data"].arrayValue.compactMap({ CategoryData(json: $0)})
    }
}

struct CategoryData {
    var status: Int = 0
    var id: Int = 0
    var categoryname: String?
    var updatedat: String?
    var modetype: String?
    var vendorid: String?
    var image: String?
    var createdat: String?

    init(json: JSON) {
        status = json["status"].intValue
        id = json["id"].intValue
        categoryname = json["category_name"].stringValue
        updatedat = json["updated_at"].stringValue
        modetype = json["mode_type"].stringValue
        vendorid = json["vendor_id"].stringValue
        image = json["image"].stringValue
        createdat = json["created_at"].stringValue
    }
}

