//
//  UIColor.swift
//  Mehul Parmar
//
//  Created by Mehul Parmar on 14/03/16.
//  Copyright © 2017 Sooryen Innovation labs. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIColor Extension

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(heX:Int) {
        self.init(red:(heX >> 16) & 0xff, green:(heX >> 8) & 0xff, blue:heX & 0xff)
    }
    
    class func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    // Theme Color
    class func themeColor(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: 140/255.0, green: 50/255.0, blue: 206/255.0, alpha: alpha)
    }
    
    func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    //hex Color
    class func hexColor(_ heXColorSet:Int) -> UIColor {
        return UIColor(heX:heXColorSet)
    }
}
