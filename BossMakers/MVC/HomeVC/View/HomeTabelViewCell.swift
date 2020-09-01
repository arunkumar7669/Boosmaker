//
//  HomeTabelViewCell.swift
//  CabelApp
//
//  Created by Abhishek  Tomar on 27/05/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class HomeTabelViewCell: UITableViewCell {
    
    @IBOutlet weak var btnFilter: UIButton!
    
    var categoryModelObj = [CategoryData]()
    var catgoryImageModel : CategoryListingModel?
   
    weak var parentVC: HomeVC?

    @IBOutlet weak var homeCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(HomeCVC.nib, forCellWithReuseIdentifier: HomeCVC.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

 extension HomeTabelViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           
           return categoryModelObj.count
           
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCVC.identifier, for: indexPath) as? HomeCVC else { return UICollectionViewCell() }
        
        /// Image download.
        
        let imgbaseURL = ServiceUrls.imageBaseUrl
        let imagePath = self.catgoryImageModel?.imagepath ?? ""
        let modelImage = "/" + (self.categoryModelObj[indexPath.row].image ?? "") ?? ""
        let imgURL = imgbaseURL + imagePath + modelImage
    
               let url = URL(string: imgURL ?? "")
               let image = UIImage(named: "user_placeholder")
               cell.categoryImage?.kf.setImage(with: url, placeholder: image)
           cell.lblCategoryName.text = categoryModelObj[indexPath.row].categoryname
        
           return cell
       }

//       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        guard let mainView = parentVC?.storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as? SubCategoryVC else { return }
//        parentVC?.navigationController?.pushViewController(mainView, animated: true)
//       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cateogryVC = self.parentVC?.storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as? SubCategoryVC else { return }
        
        self.parentVC?.navigationController?.pushViewController(cateogryVC, animated: true)
    }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          
           return CGSize(width: screenwidth/3, height: 90)
       }

       
   }

