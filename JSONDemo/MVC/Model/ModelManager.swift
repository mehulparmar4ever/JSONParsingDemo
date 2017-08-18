//
//  ModelManager.swift
//  SportsVenue
//
//  Created by Bhavin Thummar on 03/03/17.
//  Copyright © 2017 SlideMenu. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON

// MARK:
// MARK: ModelManager
open class ModelManager {
 
//    static let sharedInstance = ModelManager()
//    private override init() {} //This prevents others from using the default '()' initializer for this class.
    
    //Facility
    func getPhotoArray(_ arrData: NSArray) -> [PhotosModel] {
        return Mapper<PhotosModel>().mapArray(JSONArray: arrData as! [[String : Any]])
    }
    
    func getPhoto (_ dict: NSDictionary) -> PhotosModel {
        return Mapper<PhotosModel>().map(JSON: dict as! [String : Any])!
    }
}
