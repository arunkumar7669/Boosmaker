//
//  ProductValueModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ProductValueModel {
    var Data: ProductValueData?
    var Status: String?
    var Message: String?

    init(json: JSON) {
        Data = ProductValueData(json: json["Data"])
        Status = json["Status"].stringValue
        Message = json["Message"].stringValue
    }
}

struct ProductValueData {
    var productattributedata = [Product_attribute_data]()

    init(json: JSON) {
        productattributedata = json["product_attribute_data"].arrayValue.compactMap({ Product_attribute_data(json: $0)})
    }
}

struct Product_attribute_data {
    var atributeid: Int = 0
    var status: Int = 0
    var createdat: String?
    var subcategoryid: Int = 0
    var id: Int = 0
    var producttypeid: Int = 0
    var vendorid: String?
    var value: String?
    var updatedat: String?
    var categoryid: Int = 0

    init(json: JSON) {
        atributeid = json["atribute_id"].intValue
        status = json["status"].intValue
        createdat = json["created_at"].stringValue
        subcategoryid = json["subcategory_id"].intValue
        id = json["id"].intValue
        producttypeid = json["product_type_id"].intValue
        vendorid = json["vendor_id"].stringValue
        value = json["value"].stringValue
        updatedat = json["updated_at"].stringValue
        categoryid = json["category_id"].intValue
    }
}
