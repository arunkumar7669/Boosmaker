//
//  CustomerInfoTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class CustomerInfoTVC: UITableViewCell {
    @IBOutlet weak var lblSupplier: UILabel!
    @IBOutlet weak var lblPaymentMethod: UILabel!
    @IBOutlet weak var lblSenderName: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var btnExchange: UILabel!
    @IBOutlet weak var btnCancelOrder: UILabel!
    
    @IBOutlet weak var lblDayReturn: UILabel!
    @IBOutlet weak var lblDayExchange: UILabel!
    @IBOutlet weak var lblDayLeftCancelOrder: UILabel!
    @IBOutlet weak var btnReturn: UILabel!
    @IBOutlet weak var txtAddress: UITextView!
    @IBOutlet weak var lblCustomerContact: UILabel!
    @IBOutlet weak var lblSenderContact: UILabel!
    @IBOutlet weak var lblOrderStatus: UILabel!
    @IBOutlet weak var lblOrderID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
