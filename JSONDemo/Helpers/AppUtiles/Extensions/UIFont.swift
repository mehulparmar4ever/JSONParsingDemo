//
//  UIFont.swift
//  RealPlans
//
//  Created by Bhuvan on 18/02/16.
//  Copyright © 2017 Sooryen Innovation labs Studio. All rights reserved.
//

import Foundation
import UIKit


// MARK: - UIFont Extension
extension UIFont {
    
    func Light(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Light", size: getSize(size))!
    }
    
    func Regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Regular", size: getSize(size))!
    }
    
    func Semibold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Semibold", size: getSize(size))!
    }
    
    func Bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "ProximaNova-Bold", size: getSize(size))!
    }
    
    func getSize (_ size: CGFloat) -> CGFloat {
        
        var sizeMain = size
        
        if Screen.isIphone6Plus {
            sizeMain = sizeMain + 2
        }
        else if Screen.isIphone6 {
            sizeMain = sizeMain + 1
        }
        return CGFloat(sizeMain)
    }
}
