//
//  SubCategoryTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 08/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class SubCategoryTVC: UITableViewCell {

    @IBOutlet weak var lblSubCategory: UILabel!
    @IBOutlet weak var subCategoryCV: UICollectionView!
    
    var subCategoryData = [SubCategoryData]()
    var subCategoryDataObj : SubCategoryModel?
   
    override func awakeFromNib() {
        super.awakeFromNib()
              subCategoryCV.delegate = self
              subCategoryCV.dataSource = self
              subCategoryCV.register(HomeCVC.nib, forCellWithReuseIdentifier: HomeCVC.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
    
    extension SubCategoryTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return subCategoryData.count
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCVC.identifier, for: indexPath) as? HomeCVC else { return UICollectionViewCell() }
         
         /// Image download.
         
         let imgbaseURL = ServiceUrls.imageBaseUrl
         let imagePath = self.subCategoryDataObj?.imagepath ?? ""
         let modelImage = "/" + (self.subCategoryData[indexPath.row].image ?? "") ?? ""
         let imgURL = imgbaseURL + imagePath + modelImage
     
                let url = URL(string: imgURL ?? "")
                let image = UIImage(named: "user_placeholder")
                cell.categoryImage?.kf.setImage(with: url, placeholder: image)
            cell.lblCategoryName.text = subCategoryData[indexPath.row].subname
         
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//         guard let mainView = self.storyboard.instantiateViewController(withIdentifier: "SubCategoryVC") as? SubCategoryVC else { return }
//
//                    self.navigationController?.pushViewController(mainView, animated: true)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
            return CGSize(width: (screenwidth/3.2) - 10, height: 90)
        }

        
    }
    

