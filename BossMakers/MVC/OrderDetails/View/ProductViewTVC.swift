//
//  ProductViewTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class ProductViewTVC: UITableViewCell {

    @IBOutlet weak var btnTrackOrder: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
