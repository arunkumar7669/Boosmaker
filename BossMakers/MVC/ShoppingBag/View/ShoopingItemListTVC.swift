//
//  ShoopingItemListTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 10/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class ShoopingItemListTVC: UITableViewCell {
    
    
    @IBOutlet weak var btnIncrease: UIButton!
    @IBOutlet weak var btnDecrease: UIButton!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
