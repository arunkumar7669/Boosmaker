//
//  HeaderView.swift
//  Red Carpet
//
//  Created by Tomar on 4/12/19.
//  Copyright © 2019 Tomar. All rights reserved.
//

import UIKit

class HeaderView: UIXibView{

    
    //MARK: - Outlets -
    @IBOutlet weak var backHeaderButton: UIButton!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var lblprofile: UILabel!
    
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var backBG: UIView!
    @IBOutlet weak var btnSearch: UIButton!
    
    var navigation : UINavigationController?

    override func awakeFromNib() {
        super.awakeFromNib()
        //self.headerLbl.isHidden = true
        self.lblprofile.isHidden = true
        self.btnSearch.isHidden = true
        self.btnFilter.isHidden = true
//        self.saveBtn.isHidden=true; self.backHeaderButton.addTarget(self, action: #selector(backTap), for: .touchUpInside)
//        if Us == "ar"  {
//            let img = UIImage(named: "ic_back_b")?.imageFlippedForRightToLeftLayoutDirection()
//            (headerViewLogin.navigation).setImage(img, for: .normal)
        
//        }
      //  let topRight = UIView(frame: CGRect(x: 120, y: 200, width: 120, height: 120))

            // Change here the function to set corner radius.
//            backBG.roundedBottom()
//        backBG.backgroundColor = Constants.themeColor

        
    }
    
   // Vinay
    var titleString: String = "" {
        didSet {
           // xibSetup()
        }
    }

    var isBackgroundDark: Bool = false{
        didSet {
            //xibSetup()
        }
    }
    
//    func xibSetup() {
//
//            backHeaderButton.on(.touchUpInside) { [weak self] (_) in
//                if let parentVC = self?.parentContainerViewController() {
//                    parentVC.view.endEditing(true)
//                    if parentVC.isModal {
//                        parentVC.dismiss(animated: true, completion: nil)
//                    } else {
//                        parentVC.navigationController?.popViewController(animated: true)
//                    }
//                }
//          }
//
//
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       // xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       // xibSetup()
    }

    
}
