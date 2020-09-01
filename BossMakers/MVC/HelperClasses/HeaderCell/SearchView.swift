//
//  SearchView.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 04/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import UIKit


class SearchView: UIXibView {
    @IBOutlet weak var searchViewBG: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var backTapped: UIButton!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        tfSearch.addPaddingLeft(10.0)
        
        
        
        
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        if Defaults().language == "ar" {
////        let imgBack = UIImage(named: "ic_back_white")?.imageFlippedForRightToLeftLayoutDirection()
////        self.backTapped.setImage(imgBack, for: .normal)
//        }
//        if Defaults().userType == "user"{
//                    searchViewBG.backgroundColor = Constants.apptabColor
//                    tfSearch.backgroundColor = Constants.apptabColor
//             // tfSearch.placeholder = localization.searchMoreServices
//                    img.image = UIImage(named: "ic_search-3")
//                } else if Defaults().userType == "vender" {
//            
//                   
//               searchViewBG.backgroundColor = Constants.vendorSearchColor
//                tfSearch.backgroundColor = Constants.vendorSearchColor
////            if Defaults().language == "en" {
//            //tfSearch.placeholder = localization.search
////            }else{
////               tfSearch.placeholder = "البحث"
////            }
//            
//                    
//                    tfSearch.textColor = Constants.searchtext
//                    img.image = UIImage(named: "ic_search-3")
//                }
//        self.tfSearch.textAlignment = self.isRTL ? .right : .left
//        // tfSearch.placeholder = localization.searchMoreServices
//    }
}
