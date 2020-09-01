//
//  AddImageTVC.swift
//  BossMakers
//
//  Created by Abhishek  Tomar on 14/07/20.
//  Copyright © 2020 Abhishek  Tomar. All rights reserved.
//

import UIKit


class AddImageTVC: UITableViewCell {
    @IBOutlet weak var gridView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
          gridView.register(AddImageListCVC.nib, forCellWithReuseIdentifier: AddImageListCVC.identifier)
        
        gridView.delegate = self
        gridView.dataSource = self

    }
    
}
    
    
    extension AddImageTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddImageListCVC.identifier, for: indexPath) as? AddImageListCVC else { return UICollectionViewCell() }

                return cell
            
        }

            
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width / 3 - 4, height: collectionView.frame.width / 3 - 4)
        }
        
       

    
}

