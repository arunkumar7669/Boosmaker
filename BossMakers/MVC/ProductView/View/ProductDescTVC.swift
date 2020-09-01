//
//  ProductDescTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 12/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class ProductDescTVC: UITableViewCell {

    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblWork: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblSlevess: UILabel!
    @IBOutlet weak var lblFebric: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnCopy: UIButton!
    @IBOutlet weak var lblFinalPrice: UILabel!
    @IBOutlet weak var lblExtraDiscount: UILabel!
    @IBOutlet weak var lblBossMakerPrice: UILabel!
    @IBOutlet weak var lblLength: UILabel!
    @IBOutlet weak var lblMrp: UILabel!
    @IBOutlet weak var lblDispatchDays: UILabel!
    @IBOutlet weak var lblProductCode: UILabel!
    @IBOutlet weak var lblProductName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
