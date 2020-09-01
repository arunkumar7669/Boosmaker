//
//  PriceTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class PriceTVC: UITableViewCell {
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnOnlinePay: UIButton!
    @IBOutlet weak var btnCOD: UIButton!
    @IBOutlet weak var lblTotalPrice: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
