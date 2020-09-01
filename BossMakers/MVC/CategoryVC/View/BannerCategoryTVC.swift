//
//  BannerCategoryTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 09/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit

class BannerCategoryTVC: UITableViewCell {

    @IBOutlet weak var bannerCategoryScndTable: UICollectionView!
   
     var bannerCatdata = [SubCategoryBannerData]()
       var bannerCatModelObj : SubCategoryBannerModel?
                
               
               
                override func awakeFromNib() {
                    super.awakeFromNib()
                  Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
                    bannerCategoryScndTable.delegate = self
                    bannerCategoryScndTable.dataSource = self
                   bannerCategoryScndTable.register(HeaderScrollCVC.nib, forCellWithReuseIdentifier: HeaderScrollCVC.identifier)

                }

                override func setSelected(_ selected: Bool, animated: Bool) {
                    super.setSelected(selected, animated: animated)
                }
            
            @objc func scrollAutomatically(_ timer1: Timer) {
                
                if let coll  = bannerCategoryScndTable {
                    for cell in coll.visibleCells {
                        let indexPath: IndexPath? = coll.indexPath(for: cell)
                        if ((indexPath?.row)!  < bannerCatdata.count - 1){
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

            extension BannerCategoryTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

                func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                    
                    return bannerCatdata.count
                    
                }
                
                func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderScrollCVC.identifier, for: indexPath) as? HeaderScrollCVC else { return UICollectionViewCell() }
                    
                 
                    let imgbaseURL = ServiceUrls.imageBaseUrl
                    let imagePath = self.bannerCatModelObj?.imagepath ?? ""
                    let modelImage = "/" + (self.bannerCatdata[indexPath.row].image ?? "") ?? ""
                    let imgURL = imgbaseURL + imagePath + modelImage
                  
                  let url = URL(string: imgURL ?? "")
                  let image = UIImage(named: "banner_ic")
                  cell.imageViewHomeHeaderScroll?.kf.setImage(with: url, placeholder: image)
                    
                    return cell
                }

                func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc: ProductViewVC = storyboard.instantiateViewController(withIdentifier: "ProductViewVC") as! ProductViewVC
//                    vc.BusinessData = arrDict[indexPath.row]
//                    self.presentViewController(vc, animated: true, completion: nil)
//                    guard let mainView = self.storyboard.instantiateViewController(withIdentifier: "ProductViewVC") as? ProductViewVC else { return }
//                    let countrId = self.categoryHomeModel?.Data[indexPath.row].id
//                    mainView.catelogID = countrId
                  //  self.present(vc, animated: true, completion: nil)
                }

                func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                   
                    return CGSize(width: screenwidth, height: 170)
                }

                
            }
