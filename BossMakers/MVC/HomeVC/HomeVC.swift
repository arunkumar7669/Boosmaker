//
//  HomeVC.swift
//  BossMakers
//
//  Created by Saurabh Gaur on 05/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var homeTableView: UITableView!
     
     
    var documentInteractionController: UIDocumentInteractionController = UIDocumentInteractionController()
    var categoryHomeModel     :       CategoryListingModel?
    var bannerHomeModel       :       HomeBannerModel?
    var catelogModelObj       :       CatelogModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryListAPI()
        bannerAPI()
        //brandListAPI()
        catelogListAPI()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        homeTableView.register(HeaderScrollTVC.nib, forCellReuseIdentifier: HeaderScrollTVC.identifier)
        homeTableView.register(HomeTabelViewCell.nib, forCellReuseIdentifier: HomeTabelViewCell.identifier)
        homeTableView.register(HomeListTVC.nib, forCellReuseIdentifier: HomeListTVC.identifier)
        
        
    }
    
    func categoryListAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        NetworkManager.shared.callingHttpRequest(api: .category(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.categoryHomeModel = CategoryListingModel(json : jsonResult)
            self.setUpTableView()
            
        }
    }
    
    func bannerAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        NetworkManager.shared.callingHttpRequest(api: .bannerHome(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.bannerHomeModel = HomeBannerModel(json : jsonResult)
            self.setUpTableView()
        }
    }
    
    
    
    func catelogListAPI(){
        var parameters = [String: Any]()
        parameters["API_KEY"] = Defaults().apiKey
        NetworkManager.shared.callingHttpRequest(api: .catalogueListing(param: parameters)) { (isSuccess, result) in
            guard let jsonResult = result else {
                return }
            self.catelogModelObj = CatelogModel(json : jsonResult)
            self.setUpTableView()
        }
    }
    
    
    
    func setUpTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    
    
    //----tableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        }else{
            return catelogModelObj?.Data?.CatelogList.count ?? 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 135
        } else if indexPath.section == 1 {
            return 190
        } else{
            return 350
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        }else if indexPath.section == 1 {
            
        }else{
            let registrationStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            guard let changePasswordVC = registrationStoryboard.instantiateViewController(withIdentifier: "SenderInforamtionVC") as? SenderInforamtionVC else { return }
////            changePasswordVC.providesPresentationContextTransitionStyle = true
////            changePasswordVC.definesPresentationContext = true
////           // changePasswordVC.modalPresentationStyle = .overCurrentContext
////            changePasswordVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
////            changePasswordVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//
//            self.present(changePasswordVC, animated: false, completion: nil)
           
        guard let mainView = self.storyboard?.instantiateViewController(withIdentifier: "CatelogFilterDetailVC") as? CatelogFilterDetailVC else { return }
        let countrId = self.categoryHomeModel?.Data[indexPath.row].id
        mainView.catelogID = countrId
        self.navigationController?.pushViewController(mainView, animated: true)
    }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTabelViewCell.identifier) as? HomeTabelViewCell else { return UITableViewCell() }
            guard let categoryData = self.categoryHomeModel?.Data else {
                return UITableViewCell()
            }
            cell.btnFilter.addTarget(self, action: #selector(self.pressbtnFilter(_ :)), for: .touchUpInside)
            cell.categoryModelObj = categoryData
            cell.catgoryImageModel = categoryHomeModel
            cell.homeCollectionView.reloadData()
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderScrollTVC.identifier) as? HeaderScrollTVC else { return UITableViewCell() }
            guard let banner = self.bannerHomeModel?.Data else {
                return UITableViewCell()
            }
            cell.bannerdata = banner
            cell.bannerModelObj = bannerHomeModel
            cell.gridView.reloadData()
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeListTVC.identifier) as? HomeListTVC else { return UITableViewCell() }
            guard let catImage = self.catelogModelObj?.Data?.CatelogList[indexPath.row].categlogImages else {
                return UITableViewCell()
            }
            cell.categlogImagesObj = catImage
            cell.catelogModelObj = catelogModelObj
            
            cell.btnWhatsappShare.tag = indexPath.row
            cell.btnWhatsappShare.addTarget(self, action: #selector(self.pressbtnWhatsappShare(_ :)), for: .touchUpInside)

            
            cell.productName.text = self.catelogModelObj?.Data?.CatelogList[indexPath.row].cataloguename
            cell.lblDes.text = self.catelogModelObj?.Data?.CatelogList[indexPath.row].description
            cell.lblPrice.text =  "Starting from   " +  "\(self.catelogModelObj?.Data?.CatelogList[indexPath.row].sellingprice ?? 1)"
            cell.lblCutPrice.text = self.catelogModelObj?.Data?.CatelogList[indexPath.row].ean
            
            
            //            let imgbaseURL = ServiceUrls.imageBaseUrl
            //            let imagePath = self.catelogModelObj?.imagepath ?? ""
            //            let modelImage = "/" + (self.catelogModelObj?.Data?.CatelogList[indexPath.row].categlogImages[indexPath.row].imageName ?? "") ?? ""
            //            let imgURL = imgbaseURL + imagePath + modelImage
            //            let url = URL(string: imgURL ?? "")
            //            let image = UIImage(named: "user_placeholder")
            //            cell.brandImgMiddle?.kf.setImage(with: url, placeholder: image)
            
            
            
            return cell
            
        default:
            let cell = UITableViewCell()
            return cell
        }
        
    }
    
    @objc func pressbtnFilter(_ sender: UIButton) {
        let registrationStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = registrationStoryboard.instantiateViewController(withIdentifier: "AddSenderVC") as? AddSenderVC else { return }
        nextVC.providesPresentationContextTransitionStyle = true
        nextVC.definesPresentationContext = true
        nextVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        nextVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.navigationController?.present(nextVC, animated: false, completion: nil)
        
    }
    
    @objc func pressbtnWhatsappShare(_ sender: UIButton) {
        shareByWhatsapp(msg: "hiiiii")
}
    func shareByWhatsapp(msg:String){
       let urlWhats = "whatsapp://send?text=\(msg)"
       if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
           if let whatsappURL = NSURL(string: urlString) {
               if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                   UIApplication.shared.openURL(whatsappURL as URL)
               } else {

                   let alert = UIAlertController(title: NSLocalizedString("Whatsapp not found", comment: "Error message"),
                                                 message: NSLocalizedString("Could not found a installed app 'Whatsapp' to proceed with sharing.", comment: "Error description"),
                                                 preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Alert button"), style: UIAlertAction.Style.default, handler:{ (UIAlertAction)in
                   }))

                   self.present(alert, animated: true, completion:nil)
                   // Cannot open whatsapp
               }
           }
    
}
}
}

