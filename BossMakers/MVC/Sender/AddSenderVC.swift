//
//  AddSenderVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 20/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class AddSenderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCancelTapped(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnDismiss(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
