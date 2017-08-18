//
//  CustomEnum.swift
//  Mehul Parmar
//
//  Created by mehulmac on 20/07/17.
//  Copyright © 2017 Mehul Parmar. All rights reserved.
//

import Foundation

//MARK:
//MARK: All Enum methods
//MARK:
enum UserType:String {
    
    case Fresh      = "0"
    case Login      = "1"
    case SignUp     = "2"
    case Facebook   = "3"
    case Google     = "4"
    
}

enum SocialType:String {
    
    case Noramal      = "0"
    case Facebook     = "1"
    case Google       = "2"
    
}

enum BidHistoryRequest:String {
    
    case Archive   = "0"
    case Expired = "1"
    case Confirmed  = "2"
    
    case BidHistoryRequestType
    var Archive : String{
        return "archived"
    }
    var Expired : String{
        return "expired"
    }
    var Confirmed : String{
        return "confirmed"
    }
}

enum BookingStatusInt : Int {
    case All        =   0
    case Expired    =   3
    case Success    =   2
}

enum BookingStatus:String {
    
    case BookingStatusType
    var All : String{
        return "0"
    }
    
    var strAll : String{
        return "All"
    }
    
    var Expired : String{
        return "3"
    }
    
    var strExpired : String{
        return "Archived"
    }
    
    var Success : String{
        return "2"
    }
    
    var strSuccess : String{
        return "Success"
    }
}

enum TransactionStatus:String {
    
    case TransactionStatusType
    var All : String{
        return ""
    }
    
    var strAll : String{
        return "All"
    }
    
    var OPEN : String{
        return "1"
    }
    
    var strOPEN : String{
        return "Open"
    }
    
    var REOPENED : String{
        return "2"
    }
    
    var strREOPENED : String{
        return "Re-Open"
    }
    
    var CLOSED : String{
        return "0"
    }
    
    var strCLOSED : String{
        return "Closed"
    }
}

enum PriorityStatus:String {
    
    case PriorityStatusType
    var Low : String{
        return "1"
    }
    
    var Normal : String{
        return "2"
    }
    
    var High : String{
        return "3"
    }
    
}

enum PaymentStatus:String {
    
    case PaymentStatusType
    var Success : String{
        return "success"
    }
    
    var Decline : String{
        return "decline"
    }
    
    var Error : String{
        return "error"
    }
}

enum UserCountry  :   String {
    //TO check use below
    case India      = "1"
    case US         = "3"
    case Other      = "other"
    
    //To get value use below
    case ID
    var India : String  {
        return "1"
    }
    
    var US : String {
        return "3"
    }
    
    var Other : String {
        return "other"
    }
}

enum ApiType:String {
    
    case Post      = "POST"
    case Get       = "GET"
    
}


enum UnitType:Int {
    
    case MILES  = 1
    case KM     = 0
}

enum Gender:String {
    
    case Male   = "Male"
    case Female = "Female"
    case Other  = "Custom"
}

enum UserAs:String {
    
    case Passenger = "1"
    case Driver = "2"
}

enum BidLocationType:String {
    
    case LocationType
    var Region : String{
        return "region"
    }
    var City : String{
        return "city"
    }
}

enum BidSort:String {
    
    case BidSortType
    var Closest_Date : String{
        return "0"
    }
    var High_Price : String{
        return "1"
    }
}

enum BidRequest:String {
    
    case BidRequestType
    var Active : String{
        return "0"
    }
    var Pending : String{
        return "1"
    }
    var Confirm : String{
        return "2"
    }
    var Expired : String{
        return "3"
    }
    var Archive : String{
        return "4"
    }
}

enum BidType : Int {
    case Active     =   0
    case Pending    =   1
    case Confirmed  =   2
    case Expired    =   3
    case Archive    =   4
    //    status: status of the bid; 0 - for request with no offers, 1 - for request which have some active offers and none yet accepted, 2 - for request with offer accepted by customer, 3 - for request which is expired (validity is over), 4 - for deleted request (these don't appear in the response)
}

enum PlusMinusType : Int {
    case AddRoom = 1
    case SubtractRoom = 2
    case AddAdult = 3
    case SubtactAdult = 4
    case AddChild = 5
    case SubtactChild = 6
}

enum BidOfferSort:String {
    
    case type
    var Nearest : String{
        return "0"
    }
    
    var strNearest : String{
        return "Nearest from requested location"
    }
}
