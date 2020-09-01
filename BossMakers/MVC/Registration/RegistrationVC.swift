//
//  RegistrationVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 08/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit
import DropDown
import SwiftyJSON

class RegistrationVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var countryDataModel: CountryModel?
    var stateDataModel: StateModel?
    var cityDataModel: CityModel?
    var countryID: String?
    var catIdC: String?
    var countryDataID: String?
    var stateID: String?
    var staIdC: String?
    var stateDataID: String?
    var cityID: String?
    var citIdC: String?
    var cityDataID: String?
    var picker = UIImagePickerController()
    var userImage: UIImage?
    var imgView: UIImageView?
    var data: Data?
    var imageName: String?
    var url: String?
    var isImageSelect: Bool = false
    
    @IBOutlet weak var businessnameTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var pinCodeTF: UITextField!
    @IBOutlet weak var pinTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var btnCity: UIButton!
    @IBOutlet weak var btnState: UIButton!
    @IBOutlet weak var btnCountry: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImageView?.cornerRadous(userImageView)
        stateListAPI()
        cityListAPI()
        imageUpload()
        
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func imageUpload(){
        self.imgView = self.userImageView
        if (userImage != nil) {
            self.userImageView.image = userImage
        } else {
            if Defaults().userType == "user" {
                //                    let imgURL = "\(ServiceUrls.imageBaseUrl)\(Defaults().image)"
                let url = URL(string: "\(ServiceUrls.imageBaseUrl)\(Defaults().image)")
                let image = UIImage(named: "ic_user_placeholder_big")
                self.userImageView?.kf.setImage(with: url, placeholder: image)
            } else {
                //                    let imgURL = "\(ServiceUrls.imageBaseUrl)\(Defaults().image)"
                let url = URL(string: "\(ServiceUrls.imageBaseUrl)\(Defaults().image)")
                let image = UIImage(named: "ic_user_placeholder_big")
                self.userImageView?.kf.setImage(with: url, placeholder: image)
            }
        }
    }
    
    
    
    @IBAction func addImageTapped(_ sender: Any) {
        self.showActionSheet()
    }
    
    func dataPass(data: Data, imageName: String, url: String) {
        self.data = data
        self.imageName = imageName
        self.url = url
        self.isImageSelect = true
    }
    
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera" ?? "", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) -> Void in
            self.openCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery" ?? "", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) -> Void in
            self.openGallery()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(.camera)) {
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        } else {
            let alertWarning = UIAlertView(title: "Warning", message: "You don't have camera", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
            alertWarning.show()
        }
    }
    // MARK: - Gallery
    func openGallery() {
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            guard (info[.editedImage] as? UIImage) != nil else {
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            if let imgUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                let imgName = imgUrl.lastPathComponent
                var imageNameF = ""
                imageNameF =  "profile/" + Defaults().userId + "-" + self.getTimeStemp() + "-" + "profile" + "-" + ".png"
                
                guard let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return }
                let localPath = documentDirectory.appending("/"+imgName)
                let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
                self.userImage = image?.resizedTo1MB()
                self.imgView?.image = image?.resizedTo1MB()
                if let data = image?.pngData() as NSData? {
                    data.write(toFile: localPath, atomically: true)
                    let photoURL = URL(fileURLWithPath: localPath)
                    if let imageData = try? Data(contentsOf: photoURL) {
                        self.dataPass(data: imageData, imageName: imageNameF, url: photoURL.absoluteString)
                    }
                }
                
            } else {
                if  let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                    self.userImage = image.resizedTo1MB()
                    let data = image.pngData() as? NSData
                    guard let docDir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) else { return }
                    let imageUniqueName: Int64 = Int64(NSDate().timeIntervalSince1970 * 1_000)
                    var imageNameF = ""
                    imageNameF =  "profile/" + Defaults().userId + "-" + self.getTimeStemp() + "-" + "profile" + "-" + ".png"
                    
                    let filePath = docDir.appendingPathComponent("/\(imageUniqueName).png")
                    do {
                        if let pngImageData = (info[UIImagePickerController.InfoKey.editedImage] as? UIImage)?.pngData() {
                            try pngImageData.write(to: filePath, options: .atomic)
                            self.dataPass(data: pngImageData, imageName: "\(imageNameF)", url: filePath.absoluteString)
                        }
                        
                    } catch {
                        print("couldn’t write image")
                    }
                }
            }
            picker.dismiss(animated: true, completion: nil)
           
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        ///Get time stemp.
        func getTimeStemp() -> String {
            let date = Date()
            let time: Int = Int(date.timeIntervalSince1970)
            return "\(time)"
        }
    
    
    
    @IBAction func btnCountryTapped(_ sender: UIButton) {
        //        let dropDown = DropDown()
        //
        //        /// RTL.
        //        dropDown.customCellConfiguration = { [weak self] (_, _, cell: DropDownCell) -> Void in
        //
        //            cell.optionLabel.textAlignment = .left
        //        }
        //
        //        dropDown.anchorView = sender
        //        dropDown.width = 280
        //        dropDown.dataSource = (self.countryDataModel?.Data.map { $0.name ?? "" } ?? [""])
        //        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
        //            print("Selected item: \(item) at index: \(index)")
        //
        //            //                label.text = item
        //            sender.setTitle(item, for: .normal)
        //            let id = self.countryDataModel?.Data[index].id
        //           self.stateDataModel?.Data[sender.tag].countryid = id ?? 0
        //            self.countryDataID = "\(id)"
        //        }
        //        dropDown.show()
    }
    
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        
    }
    
    @IBAction func btnGoogleTapped(_ sender: Any) {
    }
    @IBAction func btnFBTapped(_ sender: Any) {
    }
    
    @IBAction func btnCityTapped(_ sender: UIButton) {
        
        let citydropDown = DropDown()
        
        /// RTL.
        citydropDown.customCellConfiguration = { [weak self] (_, _, cell: DropDownCell) -> Void in
            
            cell.optionLabel.textAlignment =  .left
        }
        
        citydropDown.anchorView = sender
        citydropDown.width = 280
        citydropDown.dataSource = (self.cityDataModel?.Data.map { $0.name ?? "" } ?? [""])
        citydropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            //                label.text = item
            //sender.setTitle(item, for: .normal)
            self.cityTF.text = item
            let id = self.cityDataModel?.Data[index].id
            self.cityDataModel?.Data[sender.tag].id = id ?? 0
            self.cityDataID = "\(id)"
        }
        citydropDown.show()
        
    }
    @IBAction func btnCancelTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnStateTapped(_ sender: UIButton) {
                let statedropDowndropDown = DropDown()
        
                /// RTL.
                statedropDowndropDown.customCellConfiguration = { [weak self] (_, _, cell: DropDownCell) -> Void in
        
                    cell.optionLabel.textAlignment = .left
                }
        
                statedropDowndropDown.anchorView = sender
                statedropDowndropDown.width = 280
                statedropDowndropDown.dataSource = (self.stateDataModel?.Data.map { $0.statename ?? "" } ?? [""])
                statedropDowndropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                    print("Selected item: \(item) at index: \(index)")
        
                    //                label.text = item
                   // sender.setTitle(item, for: .normal)
                    self.stateTF.text = item
                    let id = self.stateDataModel?.Data[index].id
                    self.cityDataModel?.Data[sender.tag].stateid = id ?? 0
                    self.stateDataID = "\(id)"
                
        }
        
                statedropDowndropDown.show()
        
        
    }
    
    
    @IBAction func btnRegisterTapped(_ sender: Any) {
        guard let pin = pinCodeTF.checkValidation(validation: .otpVerification) else { return }
        if pin.count < 6 {
            self.showError(message: "The Pincode must be at least 6 characters")
            
            return
        }
        
        guard let mpin = pinTF.checkValidation(validation: .mpin) else { return }
        if mpin.count < 4 {
                self.showError(message: "The Pincode must be at least 4 characters")
                   
                   return
               }
        
        guard let mobile = mobileTF.checkValidation(validation: .phone) else { return }
        if mobile.count < 10 {
                self.showError(message: "The Mobile Number must be at least 10 characters")
                   
                   return
        }
        
        var parameters = [String:Any]()
        parameters["API_KEY"] = Defaults().apiKey
        parameters["name"] =  nameTF.text
        parameters["email"] =  "aaa@gmail.com"
        parameters["phone"] = mobile
        parameters["m_pin"] =  mpin
        parameters["city_id"] =  cityDataID
        parameters["state_id"] =  "38"
        parameters["company"] = businessnameTF.text
        parameters["postbox"] =  pin
        parameters["device_id"] =  "confirmPass"
        parameters["device_platform"] =  "iOS"
        
 //       parameters["device_type"] =  "2"
//        parameters["device_token"] =  Defaults().deviceToken
//        parameters["lang"] =  Defaults().language
        
        NetworkManager.shared.callingHttpRequest(api: .userRegistration(param: parameters)) { (isSuccess, result) in
            if isSuccess == 1 {
                logDebug("success")
                //                let tokenDic = result?["token"].dictionaryObject
                let dataDic = result?["data"].dictionaryObject
                let token = result?["token"].stringValue
                let userId = result?["CustomerID"] as? Int ?? 0
                let userType = result?["user_type"] as? String ?? "1"
                Defaults().userPhone = result?["CustomerPhone"] as? String ?? ""
                Defaults().userEmail = result?["email"] as? String ?? ""
                Defaults().image = result?["image"] as? String ?? ""
                
                    Defaults().userName = result?["CustomerName"] as? String ?? ""
                    Defaults().userAddress = result?["address"] as? String ?? ""
                
                Defaults().userToken = token ?? ""
                Defaults().userId = "\(userId)"
                    let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rootTabbar") as? UITabBarController ?? UITabBarController()
                    mainView.selectedIndex = 0
                    self.navigationController?.pushViewController(mainView, animated: true)
     
                }
            }
        }
    
                
                func stateListAPI(){
                    var parameter = [String: Any]()
                    parameter["API_KEY"] = Defaults().apiKey
                    NetworkManager.shared.callingHttpRequest(api: .stateList(param: parameter )) { (isSuccess, result) in
                        guard let jsonResult = result else { return }
                        
                                    if isSuccess == 1 {
                        
                        
                        
                                        self.stateDataModel = StateModel(json : jsonResult)
                        
                                        DispatchQueue.main.async {
                                            for item in self.stateDataModel!.Data {
                                                let idData = String(item.id)
                                                if idData == self.countryID {
                                                    self.catIdC = "\(idData ?? "")"
                                                    self.countryDataID = String(item.id)
                                                    self.stateTF.text = item.statename
                                                }
                                            }
                                        }
                        
                        
                                    } else {
                                        self.showError(message: "Country not found")
                                    }
                    }
                }
                
                
                func cityListAPI(){
                    var parameter = [String: Any]()
                    parameter["API_KEY"] = Defaults().apiKey
                    parameter["stateid"] = stateDataID
                    
                    NetworkManager.shared.callingHttpRequest(api: .cityList(param: parameter )) { (isSuccess, result) in
                        guard let jsonResult = result else { return }
                        if isSuccess == 1 {
                            
                            
                            self.cityDataModel = CityModel(json : jsonResult)
                            
                            DispatchQueue.main.async {
                                for item in self.cityDataModel!.Data {
                                    let idData = String(item.id)
                                    if idData == self.cityID {
                                        self.cityID = "\(idData ?? "")"
                                        self.cityDataID = String(item.id)
                                        self.cityTF.text = item.name
                                    }
                                }
                            }
                            
                            
                        } else {
                            self.showError(message: "Country not found")
                        }
                    }
                }
                
                
}
