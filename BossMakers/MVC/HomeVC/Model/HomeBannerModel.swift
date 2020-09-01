//
//  HomeBannerModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 16/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct HomeBannerModel {
    var Status: String?
    var Data = [HomeBannerData]()
    var Message: String?
    var imagepath: String?

    init(json: JSON) {
        Status = json["Status"].stringValue
        Data = json["Data"].arrayValue.compactMap({ HomeBannerData(json: $0)})
        Message = json["Message"].stringValue
        imagepath = json["imagepath"].stringValue
    }
}

struct HomeBannerData {
    var status: Int = 0
    var id: Int = 0
    var updatedat: String?
    var bannername: String?
    var createdat: String?
    var image: String?

    init(json: JSON) {
        status = json["status"].intValue
        id = json["id"].intValue
        updatedat = json["updated_at"].stringValue
        bannername = json["banner_name"].stringValue
        createdat = json["created_at"].stringValue
        image = json["image"].stringValue
    }
}
