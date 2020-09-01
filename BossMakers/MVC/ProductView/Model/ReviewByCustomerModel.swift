//
//  ReviewByCustomerModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 14/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

class ReviewByCustomerModel {
    var message: String?
    var data = [ReviewData]()
    var status: String?

    init(json: JSON) {
        message = json["message"].stringValue
        data = json["data"].arrayValue.compactMap({ ReviewData(json: $0)})
        status = json["status"].stringValue
    }
}

class ReviewData {
    var ReviewComment: String?
    var ReviewTitle: String?
    var ProductID: Int = 0
    var Nooflikes: Int = 0
    var createdat: String?
    var id: Int = 0
    var ReviewDate: String?
    var customerid: Int = 0
    var ReviewRating: Int = 0
    var ReviewTime: String?
    var ReviewIP: String?
    var updatedat: String?
    var Noofdislike: Int = 0

    init(json: JSON) {
        ReviewComment = json["Review_Comment"].stringValue
        ReviewTitle = json["Review_Title"].stringValue
        ProductID = json["ProductID"].intValue
        Nooflikes = json["No_of_likes"].intValue
        createdat = json["created_at"].stringValue
        id = json["id"].intValue
        ReviewDate = json["Review_Date"].stringValue
        customerid = json["customer_id"].intValue
        ReviewRating = json["Review_Rating"].intValue
        ReviewTime = json["Review_Time"].stringValue
        ReviewIP = json["Review_IP"].stringValue
        updatedat = json["updated_at"].stringValue
        Noofdislike = json["No_of_dislike"].intValue
    }
}

