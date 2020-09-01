//
//  CatelogModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 19/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CatelogModel {
    var Message: String?
    var imagepath: String?
    var Data: CatelogData?
    var Status: String?

    init(json: JSON) {
        Message = json["Message"].stringValue
        imagepath = json["imagepath"].stringValue
        Data = CatelogData(json: json["Data"])
        Status = json["Status"].stringValue
    }
}

struct CatelogData {
    var CatelogList = [CatelogListData]()

    init(json: JSON) {
        CatelogList = json["CatelogList"].arrayValue.compactMap({ CatelogListData(json: $0)})
    }
}




struct CatelogListData {
    var id: Int = 0
    var mrp: Int = 0
    var productratting: String?
    var brandid: Int = 0
    var width: Int = 0
    var hight: Int = 0
    var subcategoryid: Int = 0
    var sku: String?
    var sellingprice: Int = 0
    var producttypeid: Int = 0
    var ean: String?
    var categoryid: Int = 0
    var description: String?
    var productdiscount: String?
    var cataloguename: String?
    var weight: Int = 0
    var inveontry: String?
    var lenth: Int = 0
    var categlogImages = [CateglogImages]()

    init(json: JSON) {
        id = json["id"].intValue
        mrp = json["mrp"].intValue
        productratting = json["product_ratting"].stringValue
        brandid = json["brand_id"].intValue
        width = json["width"].intValue
        hight = json["hight"].intValue
        subcategoryid = json["subcategory_id"].intValue
        sku = json["sku"].stringValue
        sellingprice = json["selling_price"].intValue
        producttypeid = json["product_type_id"].intValue
        ean = json["ean"].stringValue
        categoryid = json["category_id"].intValue
        description = json["description"].stringValue
        productdiscount = json["product_discount"].stringValue
        cataloguename = json["catalogue_name"].stringValue
        weight = json["weight"].intValue
        inveontry = json["inveontry"].stringValue
        lenth = json["lenth"].intValue
        categlogImages = json["CateglogImages"].arrayValue.compactMap({ CateglogImages(json: $0)})
    }
}

struct CateglogImages {
var imageCatelogID: Int = 0
var imageNameID: Int = 0
var imageName: String?

init(json: JSON) {
    imageCatelogID = json["imageCatelogID"].intValue
    imageNameID = json["imageNameID"].intValue
    imageName = json["imageName"].stringValue
}
}
