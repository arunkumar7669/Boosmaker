//
//  CategoryListTVC.swift
//  BossMakers
//
//  Created by Saurabh Gaur on 05/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class CategoryListTVC: UITableViewCell {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categoryModelObj = [CategoryData]()
    var categoryImageModel : CategoryListingModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(CategoryCVC.nib, forCellWithReuseIdentifier: CategoryCVC.identifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension CategoryListTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoryModelObj.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as? CategoryCVC else { return UICollectionViewCell() }
       let imgbaseURL = ServiceUrls.imageBaseUrl
                           let imagePath = self.categoryImageModel?.imagepath ?? ""
                           let modelImage = "/" + (self.categoryModelObj[indexPath.row].image ?? "") ?? ""
                           let imgURL = imgbaseURL + imagePath + modelImage
                         
                         let url = URL(string: imgURL ?? "")
                         let image = UIImage(named: "banner_ic")
                         cell.categoryImage.kf.setImage(with: url, placeholder: image)
                   cell.categoryName.text = categoryModelObj[indexPath.row].categoryname
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  20
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: 140)
//        return CGSize(width: screenwidth/2, height: 110)
    }
    
    
}

