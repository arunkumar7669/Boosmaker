//
//  CourierTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class CourierTVC: UITableViewCell {
    
    @IBOutlet weak var imageCourier: UIImageView!
    @IBOutlet weak var lblCourierName: UILabel!
    @IBOutlet weak var lblDeliverdDateEst: UILabel!
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
