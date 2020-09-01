//
//  ProductReviewTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 13/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit
import Cosmos

class ProductReviewTVC: UITableViewCell {

    @IBOutlet weak var ratingUp: UILabel!
    @IBOutlet weak var ratingDown: UILabel!
    @IBOutlet weak var reatingView: CosmosView!
    @IBOutlet weak var lblReviewComment: UILabel!
    @IBOutlet weak var reviewerName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
