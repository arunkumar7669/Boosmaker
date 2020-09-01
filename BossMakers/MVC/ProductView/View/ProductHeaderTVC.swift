//
//  ProductHeaderTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 20/06/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductHeaderTVC: UITableViewCell {
    @IBOutlet weak var gridView: UICollectionView!
    
    
    var catelogImageModel = [Product_Image]()
    var catelogDetailsModel : CatelogDetailsModel?
    
     override func awakeFromNib() {
        super.awakeFromNib()
            Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
              gridView.delegate = self
              gridView.dataSource = self
             gridView.register(HeaderScrollCVC.nib, forCellWithReuseIdentifier: HeaderScrollCVC.identifier)

          }

          override func setSelected(_ selected: Bool, animated: Bool) {
              super.setSelected(selected, animated: animated)
          }
      
      @objc func scrollAutomatically(_ timer1: Timer) {
          
          if let coll  = gridView {
              for cell in coll.visibleCells {
                  let indexPath: IndexPath? = coll.indexPath(for: cell)
                  if ((indexPath?.row)!  < catelogImageModel.count - 1){
                      let indexPath1: IndexPath?
                      indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                      
                      coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                  }
                  else{
                      let indexPath1: IndexPath?
                      indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                      coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                  }
                  
              }
          }
          
      }
          
      }

    extension ProductHeaderTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

          func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
              
              return catelogImageModel.count
              
          }
          
          func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderScrollCVC.identifier, for: indexPath) as? HeaderScrollCVC else { return UICollectionViewCell() }
              
           
              let imgbaseURL = ServiceUrls.imageBaseUrl
              let imagePath = self.catelogDetailsModel?.imagepath ?? ""
              let modelImage = "/" + (self.catelogImageModel[indexPath.row].image ?? "") ?? ""
              let imgURL = imgbaseURL + imagePath + modelImage

              let url = URL(string: imgURL ?? "")
              let image = UIImage(named: "banner_ic")
              cell.imageViewHomeHeaderScroll?.kf.setImage(with: url, placeholder: image)
              
              return cell
          }

          func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
              
          }

          func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             
              return CGSize(width: screenwidth, height: 170)
          }

          
      }
