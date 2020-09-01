//
//  ProductSizeTVF.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 12/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class ProductSizeTVF: UITableViewCell,UITextFieldDelegate {
   
    var pinCode: Postal_code?

    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var btnChoseAddress: UIButton!
    @IBOutlet weak var btnSubmitPin: UIButton!
    @IBOutlet weak var pinCodeTF: UITextField!
    @IBOutlet weak var btnIncrease: UIButton!
    @IBOutlet weak var btndecrease: UIButton!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var btnSize: UIButton!
    @IBOutlet weak var btnColor: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    @IBAction func PinTextFieldAction(_ sender: UITextField) {
     
        pinCode?.pin = Int(sender.text ?? "") ?? 0
    
    }
    
}
