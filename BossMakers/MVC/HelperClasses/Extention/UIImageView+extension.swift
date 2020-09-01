//
//  UIImageView+Extension.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 12/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
   
    func cornerRadous(_ imageView: UIImageView)
    {
        imageView.layer.cornerRadius = imageView.frame.size.width / 2;
        imageView.clipsToBounds = true;
    }
    
    func setImage(with url: String, placeholder: UIImage? = nil) {
        guard let imageUrl = URL(string: url) else { return }
        kf.indicatorType = .activity
        kf.setImage(with: imageUrl, placeholder: placeholder)
    }
    
    func cancelImageFetching() {
        kf.cancelDownloadTask()
    }

    
}
