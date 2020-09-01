//
//  OrderPriceTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class OrderPriceTVC: UITableViewCell {
    @IBOutlet weak var lblShippingCharge: UILabel!
    @IBOutlet weak var lblCODCharge: UILabel!
    
    @IBOutlet weak var lblTotal: UIView!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblSubTotal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
