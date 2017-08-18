//
//  UIImageCustom.swift
//  DriverAndServant
//
//  Created by mehul parmar on 2/8/17.
//  Copyright © 2017 SkyVeb Solutions. All rights reserved.
//

import UIKit

extension UIImage {
    func checkImage(isEqualTo image2: UIImage) -> Bool {
        let data1: Data = UIImagePNGRepresentation(self)!
        let data2: Data = UIImagePNGRepresentation(image2)!
        return (data1 == data2)
    }

    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in PNG format
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the PNG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    var png: Data? { return UIImagePNGRepresentation(self) }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ quality: JPEGQuality) -> Data? {
        return UIImageJPEGRepresentation(self, quality.rawValue)
    }
}
