//
//  RegistrationService.swift
//  Mehul Parmar
//
//  Created by Mehul Parmar on 27/05/16.
//  Copyright © 2017 Sooryen Innovation labs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper

open class PhotosService {
    
    enum listOfApi : String {
        case
        photos
    }
    
    func getPhotos(_ success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        // create request parameter
        //No needed
        
        // create post request
        NetworkManager().Get(listOfApi.photos.rawValue,
                              paramaters: nil,
                              showLoader: true,
                              success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
}
