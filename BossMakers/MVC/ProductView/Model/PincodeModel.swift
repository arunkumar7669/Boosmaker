//
//  PincodeModel.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PincodeModel {
    var Status: String?
    var Data: PincodeData?
    var Message: String?

    init(json: JSON) {
        Status = json["Status"].stringValue
        Data = PincodeData(json: json["Data"])
        Message = json["Message"].stringValue
    }
}

struct PincodeData {
    var deliverycodes = [Delivery_codes]()

    init(json: JSON) {
        deliverycodes = json["delivery_codes"].arrayValue.compactMap({ Delivery_codes(json: $0)})
    }
}

struct Delivery_codes {
    var postalcode: Postal_code?

    init(json: JSON) {
        postalcode = Postal_code(json: json["postal_code"])
    }
}



struct Postal_code {
    var cash: String?
    var pin: Int = 0
    var countrycode: String?
    var repl: String?
    var isoda: String?
    var cod: String?
    var sortcode: String?
    var maxweight: Int = 0
    var maxamount: Int = 0
    var covidzone: String?
    var pickup: String?
    var statecode: String?
    var prepaid: String?
    var district: String?

    init(json: JSON) {
        cash = json["cash"].stringValue
        pin = json["pin"].intValue
        countrycode = json["country_code"].stringValue
        repl = json["repl"].stringValue
        isoda = json["is_oda"].stringValue
        cod = json["cod"].stringValue
        sortcode = json["sort_code"].stringValue
        maxweight = json["max_weight"].intValue
        maxamount = json["max_amount"].intValue
        covidzone = json["covid_zone"].stringValue
        pickup = json["pickup"].stringValue
        statecode = json["state_code"].stringValue
        prepaid = json["pre_paid"].stringValue
        district = json["district"].stringValue
    }
}

