//
//  CatelogDetailsModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 20/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CatelogDetailsModel {
    var Status: String?
    var Data: CatelogDetailsData?
    var Message: String?
    var imagepath: String?

    init(json: JSON) {
        Status = json["Status"].stringValue
        Data = CatelogDetailsData(json: json["Data"])
        Message = json["Message"].stringValue
        imagepath = json["imagepath"].stringValue
    }
}

struct CatelogDetailsData {
    var productImage = [Product_Image]()
    var productAttribute: Product_Attribute?
    var productDetail: Product_Detail?
    var productType: Product_Type?

    init(json: JSON) {
        productImage = json["product_Image"].arrayValue.compactMap({ Product_Image(json: $0)})
        productAttribute = Product_Attribute(json: json["product_Attribute"])
        productDetail = Product_Detail(json: json["product_Detail"])
        productType = Product_Type(json: json["product_Type"])
    }
}

struct Product_Type {
    var subcategoryid: Int = 0
    var producttypename: String?
    var categoryid: Int = 0
    var status: Int = 0
    var updatedat: String?
    var id: Int = 0
    var vendorid: String?
    var createdat: String?

    init(json: JSON) {
        subcategoryid = json["subcategory_id"].intValue
        producttypename = json["product_type_name"].stringValue
        categoryid = json["category_id"].intValue
        status = json["status"].intValue
        updatedat = json["updated_at"].stringValue
        id = json["id"].intValue
        vendorid = json["vendor_id"].stringValue
        createdat = json["created_at"].stringValue
    }
}

struct Product_Detail {
    var width: Int = 0
    var brandid: Int = 0
    var categoryid: Int = 0
    var cataloguename: String?
    var metatitle: String?
    var productdiscount: String?
    var status: Int = 0
    var description: String?
    var metakeyword: String?
    var pendingstatus: Int = 0
    var ean: String?
    var vendorid: Int = 0
    var id: Int = 0
    var hight: Int = 0
    var weight: Int = 0
    var sellingprice: Int = 0
    var createdat: String?
    var productvalueid: String?
    var sku: String?
    var producttypeid: Int = 0
    var updatedat: String?
    var lenth: Int = 0
    var subcategoryid: Int = 0
    var metadiscription: String?
    var mrp: Int = 0
    var inveontry: String?
    var productratting: String?

    init(json: JSON) {
        width = json["width"].intValue
        brandid = json["brand_id"].intValue
        categoryid = json["category_id"].intValue
        cataloguename = json["catalogue_name"].stringValue
        metatitle = json["meta_title"].stringValue
        productdiscount = json["product_discount"].stringValue
        status = json["status"].intValue
        description = json["description"].stringValue
        metakeyword = json["meta_keyword"].stringValue
        pendingstatus = json["pending_status"].intValue
        ean = json["ean"].stringValue
        vendorid = json["vendor_id"].intValue
        id = json["id"].intValue
        hight = json["hight"].intValue
        weight = json["weight"].intValue
        sellingprice = json["selling_price"].intValue
        createdat = json["created_at"].stringValue
        productvalueid = json["product_value_id"].stringValue
        sku = json["sku"].stringValue
        producttypeid = json["product_type_id"].intValue
        updatedat = json["updated_at"].stringValue
        lenth = json["lenth"].intValue
        subcategoryid = json["subcategory_id"].intValue
        metadiscription = json["meta_discription"].stringValue
        mrp = json["mrp"].intValue
        inveontry = json["inveontry"].stringValue
        productratting = json["product_ratting"].stringValue
    }
}

struct Product_Attribute {
    var value = [Value]()
    var attribute: String?

    init(json: JSON) {
        value = json["value"].arrayValue.compactMap({ Value(json: $0)})
        attribute = json["attribute"].stringValue
    }
}

struct Product_Image {
    var id: Int = 0
    var image: String?
    var createdat: String?
    var catalogueid: Int = 0

    init(json: JSON) {
        id = json["id"].intValue
        image = json["image"].stringValue
        createdat = json["created_at"].stringValue
        catalogueid = json["catalogue_id"].intValue
    }
}

struct Value {
    var value: String?
    var categoryid: Int = 0
    var updatedat: String?
    var status: Int = 0
    var subcategoryid: Int = 0
    var producttypeid: Int = 0
    var id: Int = 0
    var vendorid: String?
    var createdat: String?
    var atributeid: Int = 0

    init(json: JSON) {
        value = json["value"].stringValue
        categoryid = json["category_id"].intValue
        updatedat = json["updated_at"].stringValue
        status = json["status"].intValue
        subcategoryid = json["subcategory_id"].intValue
        producttypeid = json["product_type_id"].intValue
        id = json["id"].intValue
        vendorid = json["vendor_id"].stringValue
        createdat = json["created_at"].stringValue
        atributeid = json["atribute_id"].intValue
    }
}

