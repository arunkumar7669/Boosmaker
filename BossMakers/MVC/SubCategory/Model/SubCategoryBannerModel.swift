//
//  SubCategoryBannerModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 08/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SubCategoryBannerModel {
    var Status: String?
    var Message: String?
    var Data = [SubCategoryBannerData]()
    var imagepath: String?

    init(json: JSON) {
        Status = json["Status"].stringValue
        Message = json["Message"].stringValue
        Data = json["Data"].arrayValue.compactMap({ SubCategoryBannerData(json: $0)})
        imagepath = json["imagepath"].stringValue
    }
}

struct SubCategoryBannerData {
    var id: Int = 0
    var bannername: String?
    var image: String?
    var createdat: String?
    var updatedat: String?
    var status: Int = 0

    init(json: JSON) {
        id = json["id"].intValue
        bannername = json["banner_name"].stringValue
        image = json["image"].stringValue
        createdat = json["created_at"].stringValue
        updatedat = json["updated_at"].stringValue
        status = json["status"].intValue
    }
}

