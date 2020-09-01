//
//  SubCategoryModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 08/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SubCategoryModel {
    var imagepath: String?
    var Message: String?
    var Status: String?
    var Data = [SubCategoryData]()

    init(json: JSON) {
        imagepath = json["imagepath"].stringValue
        Message = json["Message"].stringValue
        Status = json["Status"].stringValue
        Data = json["Data"].arrayValue.compactMap({ SubCategoryData(json: $0)})
    }
}

struct SubCategoryData {
    var vendorid: String?
    var image: String?
    var status: Int = 0
    var categoryid: Int = 0
    var subname: String?
    var updatedat: String?
    var createdat: String?
    var id: Int = 0

    init(json: JSON) {
        vendorid = json["vendor_id"].stringValue
        image = json["image"].stringValue
        status = json["status"].intValue
        categoryid = json["category_id"].intValue
        subname = json["sub_name"].stringValue
        updatedat = json["updated_at"].stringValue
        createdat = json["created_at"].stringValue
        id = json["id"].intValue
    }
}
