//
//  UIImageView.swift
//  RealPlans
//
//  Created by Bhuvan on 18/02/16.
//  Copyright © 2017 Sooryen Innovation labs Studio. All rights reserved.
//

import Foundation
import UIKit

import SDWebImage

// MARK: - UIImageView Extension
enum PlaceHolder : String {
    case CameraBg = "placeholder"
}

extension UIImageView {
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func setImage(fromStrUrl imagePathUrl: String , setPlaceholder PlaceholderImageType: PlaceHolder, usingActivityIndicatorStyle activityStyle: UIActivityIndicatorViewStyle) {
        
        //activityStyle
        self.setShowActivityIndicator(true)
        self.setIndicatorStyle(.gray)
        self.sd_setImage(with: URL(string: imagePathUrl))
//        
//        self.sd_setImage(with: URL(string: imagePathUrl), placeholderImage: UIImage(named: PlaceholderImageType.rawValue)!)
    }
    
//    func setGIFImage(fromStrUrl imagePathUrl: String , setPlaceholder PlaceholderImageType: PlaceHolder, usingActivityIndicatorStyle activityStyle: UIActivityIndicatorViewStyle) {
//        
//        //activityStyle
//        self.setGIFImage(fromStrUrl: imagePathUrl, setPlaceholder: UIImage(named: "logo"), usingActivityIndicatorStyle: activityStyle)
//    }
    
    //http://i.giphy.com/26tnnbphrpSrCw53O.gif
    
    func checkImage(isEqualTo image2: UIImage) -> Bool {
        let data1: Data = UIImagePNGRepresentation(self.image!)!
        let data2: Data = UIImagePNGRepresentation(image2)!
        return (data1 == data2)
    }
}
