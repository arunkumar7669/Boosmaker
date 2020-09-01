//
//  ProductTypeModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ProductTypeModel {
    var Data: ProductTypeData?
    var Message: String?
    var Status: String?

    init(json: JSON) {
        Data = ProductTypeData(json: json["Data"])
        Message = json["Message"].stringValue
        Status = json["Status"].stringValue
    }
}

struct ProductTypeData {
    var producttypeData = [Product_type_Data]()

    init(json: JSON) {
        producttypeData = json["product_type_Data"].arrayValue.compactMap({ Product_type_Data(json: $0)})
    }
}

struct Product_type_Data {
    var id: Int = 0
    var status: Int = 0
    var producttypename: String?
    var vendorid: String?
    var categoryid: Int = 0
    var subcategoryid: Int = 0
    var createdat: String?
    var updatedat: String?

    init(json: JSON) {
        id = json["id"].intValue
        status = json["status"].intValue
        producttypename = json["product_type_name"].stringValue
        vendorid = json["vendor_id"].stringValue
        categoryid = json["category_id"].intValue
        subcategoryid = json["subcategory_id"].intValue
        createdat = json["created_at"].stringValue
        updatedat = json["updated_at"].stringValue
    }
}

