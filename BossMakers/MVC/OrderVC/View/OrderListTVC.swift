//
//  OrderListTVC.swift
//  BossMakers
//
//  Created by Saurabh Gaur on 06/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class OrderListTVC: UITableViewCell {

    @IBOutlet weak var btntrackOrder: UIButton!
    @IBOutlet weak var btnorderDetails: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var lblOrderStatus: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblFrom: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
