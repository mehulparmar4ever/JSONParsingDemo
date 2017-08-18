//
//  UIButton+RoundedCorner.swift
//  Welatte
//
//  Created by Akash on 07/04/16.
//  Copyright © 2016 Akash. All rights reserved.
//

import UIKit
import SVProgressHUD


extension UIView {
    
    private var disableKeybordWhenTappedGestureRecognizerIdentifier:String {
        return "disableKeybordWhenTapped"
    }
    
    private var disableKeybordWhenTappedGestureRecognizer: TapGestureRecognizer? {
        
        let hideKeyboardGesture = TapGestureRecognizer(target: self, action: #selector(UIView.hideKeyboard), identifier: disableKeybordWhenTappedGestureRecognizerIdentifier)
        
        if let gestureRecognizers = self.gestureRecognizers {
            for gestureRecognizer in gestureRecognizers {
                if let tapGestureRecognizer = gestureRecognizer as? TapGestureRecognizer, tapGestureRecognizer == hideKeyboardGesture, tapGestureRecognizer == hideKeyboardGesture {
                    return tapGestureRecognizer
                }
            }
        }
        return nil
    }
    
    @objc private func hideKeyboard() {
        endEditing(true)
    }
    
    var disableKeybordWhenTapped: Bool {
        
        set {
            let hideKeyboardGesture = TapGestureRecognizer(target: self, action: #selector(UIView.hideKeyboard), identifier: disableKeybordWhenTappedGestureRecognizerIdentifier)
            
            if let disableKeybordWhenTappedGestureRecognizer = self.disableKeybordWhenTappedGestureRecognizer {
                removeGestureRecognizer(disableKeybordWhenTappedGestureRecognizer)
                if gestureRecognizers?.count == 0 {
                    gestureRecognizers = nil
                }
            }
            
            if newValue {
                addGestureRecognizer(hideKeyboardGesture)
            }
        }
        
        get {
            return disableKeybordWhenTappedGestureRecognizer == nil ? false : true
        }
    }
}

extension UIView {

    func showLoader() {
        if !UIApplication.shared.isIgnoringInteractionEvents {
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
        SVProgressHUD.show(withStatus: AppAlertMsg.kPleaseWait)
    }
    
    func hideLoader() {
        if UIApplication.shared.isIgnoringInteractionEvents {
            UIApplication.shared.endIgnoringInteractionEvents()
        }
        SVProgressHUD.dismiss()
    }
    
    func corner(_ radius: CGFloat, borderColor: UIColor? = nil, borderWidth: CGFloat? = nil) {
        var layer = CALayer()
        layer = self.layer
        layer.masksToBounds = true
        
        // Corner Radius
        layer.cornerRadius = radius
        
        // Border Color
        if let borderColor = borderColor {
            layer.borderColor = borderColor.cgColor
        }
        
        // Border Width
        if let borderWidth = borderWidth {
            layer.borderWidth = borderWidth
        }
    }

    func addDropShadowToView(isCornerRadiousRound: Bool){
        self.layer.masksToBounds =  false
        self.layer.shadowColor = UIColor.darkGray.cgColor;
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3.0
        
        if isCornerRadiousRound {
            self.layer.cornerRadius = 2.0
        }
    }
    
    func addDropShadowToView(isCornerRadiousRound: Bool, cornerRadius: CGFloat){
        self.layer.masksToBounds =  false
        self.layer.shadowColor = UIColor.darkGray.cgColor;
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3.0
        
        if isCornerRadiousRound {
            self.layer.cornerRadius = cornerRadius
        }
    }

    
    func addShadowin_All_Side() {
        self.layer.masksToBounds =  false
        self.layer.shadowColor  = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 1.0;
        self.layer.shadowRadius = 8.0;
    }
    
    
    func applyPlainShadow_withRoundCorner() {
        let layer = self.layer
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 8.0
        layer.cornerRadius = self.frame.size.height/2
        layer.masksToBounds = false
    }
    
    enum viewBorderMain: String {
        case Left = "borderLeft"
        case Right = "borderRight"
        case Top = "borderTop"
        case Bottom = "borderBottom"
    }
    
    func addBorder(_ vBorder: viewBorderMain, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.name = vBorder.rawValue
        switch vBorder {
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: Screen.width - width, y: 0, width: width, height: self.frame.size.height)
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: Screen.width, height: width)
        case .Bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: Screen.width, height: width)
        }
        self.layer.addSublayer(border)
    }
    
    func removeBorder(_ border: viewBorderMain , view : UIView) {
        var layerForRemove: CALayer?
        for layer in view.layer.sublayers! {
            if layer.name == border.rawValue {
                layerForRemove = layer
            }
        }
        if let layer = layerForRemove {
            layer.removeFromSuperlayer()
        }
    }
}
