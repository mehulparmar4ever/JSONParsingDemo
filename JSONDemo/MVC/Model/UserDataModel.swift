//
//  File.swift
//  SportsVenue
//
//  Created by Bhavin Thummar on 21/02/17.
//  Copyright © 2017 SlideMenu. All rights reserved.
//

import Foundation
import ObjectMapper


class PhotosModel : Mappable{
    
    var id : String?
    var title : String?
    var albumId : String?
    var url : String?
    var thumbnailUrl : String?
    
    class func newInstance(map: Map) -> Mappable?{
        return PhotosModel(map: map)
    }
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        id <- map["id"]
        title <- map["title"]
        albumId <- map["albumId"]
        url <- map["url"]
        thumbnailUrl <- map["thumbnailUrl"]

    }
}
