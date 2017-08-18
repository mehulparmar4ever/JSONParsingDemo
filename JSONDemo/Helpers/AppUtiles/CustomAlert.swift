//
//  SmoothAlert.swift
//  hotelBids
//
//  Created by Mehul Parmar on 26/11/16.
//  Copyright © 2016 hotelBids. All rights reserved.
//

import Foundation
import SDCAlertView

class CustomAlert {
    func ShowAlert(_ strMessage: String) {
        let alert = AlertController(title: Constants.kAppName, message: strMessage, preferredStyle: .alert)
        alert.add(AlertAction(title: AppAlertMsg.kOk, style: .normal))
        alert.actionLayout = .automatic
        alert.present()
    }
    
    func ShowAlert(isCancelButton: Bool,  strMessage: String, completion:@escaping (Bool) -> Void) {
        let alert = AlertController(title: Constants.kAppName, message: strMessage, preferredStyle: .alert)
        
        var strTitle = AppAlertMsg.kOk
        if isCancelButton {
            strTitle = AppAlertMsg.kYes
            
            let cancelAction = AlertAction.init(title: AppAlertMsg.kNo, style: .preferred, handler: { (alertaction) in
                completion(false)
            })
            alert.add(cancelAction)
        }
        
        let okAction = AlertAction.init(title: strTitle, style: .normal, handler: { (alertaction) in
            completion(true)
        })
        alert.add(okAction)
        
//        alert.add(AlertAction(title: "Delete", style: .destructive))
        
        alert.actionLayout = .automatic
        alert.present()
    }
    
    func ShowAlert(isCancelButton: Bool,  strTitle: String ,strMessage: String, strTrue: String, strFalse: String, completion:@escaping (Bool) -> Void) {
        
        let alert = AlertController(title: strTitle, message: strMessage, preferredStyle: .alert)
        
        if isCancelButton {
            let cancelAction = AlertAction.init(title: strFalse, style: .preferred, handler: { (alertaction) in
                completion(false)
            })
            alert.add(cancelAction)
        }
        
        let okAction = AlertAction.init(title: strTrue, style: .normal, handler: { (alertaction) in
            completion(true)
        })
        alert.add(okAction)
        
        alert.actionLayout = .automatic
        alert.present()
    }
}
