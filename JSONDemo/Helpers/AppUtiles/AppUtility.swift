//
//  Constant.swift
//  Mehul Parmar
//
//  Created by Mehul on 20/01/16.
//  Copyright © 2017 Sooryen Innovation labs Studio. All rights reserved.
//

import Foundation
import UIKit
import Reachability

// MARK: Reachability class
func isNetworkAvailable() -> Bool {
    let reachability: Reachability = Reachability.forInternetConnection()
    let networkStatus = reachability.currentReachabilityStatus()
    var isAvailable  = false;
    
    switch networkStatus {
    case .NotReachable:
        isAvailable = false;
        break;
    case .ReachableViaWiFi:
        isAvailable = true;
        break;
    case .ReachableViaWWAN:
        isAvailable = true;
        break;
    }
    return isAvailable;
}

struct Screen {
    static let STATUS_BAR_HEIGHT        =   20.0
    static let NAVIGATION_BAR_HEIGHT    =   44.0
    
    static let width                = UIScreen.main.bounds.size.width
    static let height               = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(Screen.width, Screen.height)
    static let SCREEN_MIN_LENGTH    = min(Screen.width, Screen.height)
    
    static let isIphone4            = UIDevice.current.userInterfaceIdiom == .phone && Screen.SCREEN_MAX_LENGTH < 568.0
    static let isIphone5            = UIDevice.current.userInterfaceIdiom == .phone && Screen.SCREEN_MAX_LENGTH == 568.0
    static let isIphone6            = UIDevice.current.userInterfaceIdiom == .phone && Screen.SCREEN_MAX_LENGTH == 667.0
    static let isIphone6Plus        = UIDevice.current.userInterfaceIdiom == .phone && Screen.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && Screen.SCREEN_MAX_LENGTH == 1024.0
}

//MARK:
//MARK: App related constants, key and url
//MARK:

struct Constants {
    
    // OLD CODE
    let itunesAppDownloadURL    = "https://itunes.apple.com/us/app"

    //Hotel Bids constants
    static let kAppName                 = "Mehul Parmar"
    static let kAppIdentifier           = "com.MehulParmar.app"
    
    static let KEY_Authorization        = "Authorization"
    static let KEY_remember_token       = "remember-token"
    
    static let KEY_UserDataModel        = "UserDataModel"
    static let KEY_CountryModel         = "CountryModel"
    
    static let hbDeviceToken            = "MyDeviceToken"
    static let hbUserStatus             = "UserStatus"
    static let hbEmptyDeviceToken       = "EmptyDeviceToken"
    static let hbUserData               = "UserData"
    
    static let hbUserCountry            = "userCountry"
    
    static let KEY_BranchReferralModel        = "BranchReferralModel"

    static let appDelegate                  =   UIApplication.shared.delegate as! AppDelegate
    static let mainStoryboard: UIStoryboard =   UIStoryboard(name: "Main", bundle: nil)
    
    //User Default constant
    static let KEY_Xapi                             = "Xapi"
    static let KEY_Language                         = "language"
    static let KEY_USER_ID                          = "userid"
    static let KEY_AccessToken                      = "Accesstoken"
    static let KEY_DEVICE_TOKEN                     = "Device_Token"
    
    static let KEY_LOGIN_STATUS                     = "LogInStatus"
    static let KEY_NOTIFICATION_TYPE                = "Notification"
    static let KEY_UserModel                        = "userModel"
    static let KEY_Notification_STATUS              = "Notification Status"
    
    static let dateFormat                           = "yyyy-MM-dd HH:mm:ss"
    static let dateFormat_AM_PM                     = "yyyy-MM-dd h:mm a"
    static let dateFormat_Date_only                 = "yyyy-MM-dd"
    static let dateFormat_Time_only                 = "h:mm a"
}

//MARK:
//MARK: App alert title & validation messages
//MARK:

struct AppAlertMsg {
    //Validation alert that used in this app
    
    //Alert title
    static let kPleaseWait = "Please wait"
    static let kOk = "OK"
    static let kYes = "Yes"
    static let kNo = "No"
    static let kCancel = "Cancel"
    static let kErrorMsg = "Something went wrong, please try again later"
    
    //Default alert
    static let KNameEmpty = "Please enter name"
    static let KValidName1 = "Please enter minimum 3 character name"
    static let KValidName = "User name length should be maximum 30 characters long"
    static let KEmailEmpty = "Please enter email address"
    static let KValidEmail = "Please enter valid email address"
    static let kPassword = "Please enter password"
    static let kValidPassword = "Password length should be minimum 6 characters long"
    static let KPhoneNumber = "Please enter mobile number"
    static let KValidPhoneNumber = "Mobile number should be 10 digits long"
    static let KValidPhoneNumber_1 = "Please enter valid mobile number"
    static let KCouponCode = "Please enter coupon code"
    static let KValidCouponCode = "Please enter valid coupon code"
    static let KCode = "Please enter verification code"
    static let KValidCode = "Code length should be 4 digit number long"
    static let KRateUs = "Hope you are enjoying our services. Please rate us on Apple Store"
    static let kUnAuthotized = "Invalid session, please login again"
    static let kNoInternet = "Please check your internet connection."
    static let kPasswordOld = "Please enter current password"
    static let kPasswordNew = "Please enter new password"
    static let kPasswordConfirm = "Please enter confirm password"
    static let kPasswordInvalid = "New and confirm password didn't matched"
    static let KValidPassword = "Password length should be minimum 6 characters long"
    static let KUploadingImages = "Please wait while uploading images"
    static let KValidTermsAndConditionsMsg = "Please accept terms and conditions."
    static let KDownloadingFiles = "Please wait while downloading Files"

    static let KNoCity          = "Currently no hotels available in this country"
    static let KNoCity_1        = "Please select India"
    static let KNoLocation      = "Currently no hotels available in this city"
    static let KNoLocation1      = "Property location not found."
    
    static let KNoLocation_1    = "Please select another city"
    static let KDeleteBid       = "Are you sure you want to delete this bid?"
    static let KEmailVerifyToSeeOffer    = "To view offers you need to verify your email."

    static let KEmailVarification    = "Email Verification"
    static let KEmailVarificationDescription    = "Your email is not verified. If you wish to send verification link on your registered email then click on resend option."
    
    static let KChooseDestination    = "Please select your destination."
    static let KChooseCorrectRoom    = "Please correct your room number as per number of occupants"
    static let KSetValidTill         = "Please set valid till."
    static let KNoHotelPictureAvailable     = "There are no hotel/room photos available."
    
    static let KComplainTypeEmpty = "Please select complain type"
    static let KComplainDataEmpty = "Please enter some discription"

    static let KContactNoEmpty = "No cantact detail available"

    static let KRatingEmpty = "Please provide your rating"
    static let KFeedbackEmpty = "Please enter feedback"
    
    static let KLocationAccess          =   "You must allow location access in Settings > Privacy > Location Services"
    static let KGoogleApp               =   "Google map app is not installed on your device"
    static let KNoAmenitiesAvailable    =   "There are no amenities available."
    static let KCouponAlreadyApplied    =   "Coupon already applied."
    static let KNoWalletBalance         =   "You have no enough wallet balance to use it."
    static let KTransactionDeclined     =   "Transaction was declined."
    static let KTransactionError        =   "Transaction caused an error."
    static let KSocialRegistered        =   "Social registered user can't change password."
    static let KError_use_wallet_with_no_payable_amount         =   "No require to use wallet as you have no payable amount."
    static let KError_use_coupon_with_no_payable_amount         =   "No require to use coupon as you have no payable amount."
    static let KErrorAmount_exceedinglimit                      =   "Amount exceeding the limit is 10000000"
    
    static let KNoWebsiteAvailable          =   "Website link not available."
    static let KNoPhoneNumberAvailable      =   "Phone number not available."
    static let KNoTripAdvisor_linkAvailable    =   "TripAdvisor link not available."
    static let KNoEmail_addressAvailable          =   "Email address not available."
    static let KNoEmailAppAvailable    =   "Default Email application is not installed."
    static let KLoadingCountry    =   "Please wait while loading country."
}

//MARK:
//MARK: Custom Colour
//MARK:

struct Custom {
    
    struct DateFormate {
        static let dateFormat_Long                      = "yyyy-MM-dd HH:mm:ss"
        static let dateFormat_AM_PM                     = "yyyy-MM-dd h:mm a"
        static let dateFormat_Date_only                 = "yyyy-MM-dd"
        static let dateFormat_Time_only                 = "h:mm a"
    }
    
    static let YellowColor              = UIColor(red:1.0032, green:0.836944, blue:0.34528, alpha:1.0)
    static let kHBPurpleColor           = UIColor(red:0.56, green:0.29, blue:0.67, alpha:1.0)
    static let kHBBlackColor            = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    static let KHBGreen                 = UIColor(red:120/255, green:199/255, blue:3/255, alpha:1.0)
    static let KHBRed                   = UIColor(red:255/255, green:0/255, blue:1/255, alpha:1.0)
    static let KHBToastBG                   = UIColor(heX:0xFAFAFA)
    
    static let CaribbeanGreenColor      = UIColor(heX:0x00D4A9)
    static let DownriverColor           = UIColor(heX:0x0A1A46)
    static let LochmaraColor            = UIColor(heX:0x008ED4)
    static let DustyGrayColor           = UIColor(heX:0x999999)
    static let GrayColor                = UIColor(heX:0x929292)
    static let PorcelainColor           = UIColor(heX:0xE4E8E9)
    static let AmaranthColor            = UIColor(heX:0xED2E67)
    static let ScorpionColor            = UIColor(heX:0x5E5E5E)
    static let SilverColor              = UIColor(heX:0xCCCCCC)
    static let IronColor                = UIColor(heX:0xE6E7E8)
    static let RideActivityColor        = UIColor(heX:0xDE1051)
    static let AzaleaColor              = UIColor(heX:0xF9D2E2)
    static let MintTulipColor           = UIColor(heX:0xCCF7EF)
}

// UserStatus
var isEmptyDeviceToken_AlreadyUpdated:Bool {
    get{
        return UserDefaults.standard.bool(forKey: Constants.hbEmptyDeviceToken)
    }
    set(status){
        UserDefaults.standard.set(status, forKey: Constants.hbEmptyDeviceToken)
        UserDefaults.standard.synchronize()
    }
}

var UserStatus:String {
    get{
        return UserDefaults.standard.object(forKey: Constants.hbUserStatus) as? String ?? UserType.Fresh.rawValue
    }
    set(status){
        UserDefaults.standard.set(status, forKey: Constants.hbUserStatus)
        UserDefaults.standard.synchronize()
    }
}

var DeviceToken:String {
    get{
        return UserDefaults.standard.object(forKey: Constants.KEY_DEVICE_TOKEN) as? String ?? ""
    }
    
    set(data){
        UserDefaults.standard.set(data, forKey: Constants.KEY_DEVICE_TOKEN)
        UserDefaults.standard.synchronize()
    }
}

// For Swift 3
func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

// For Swift 3
func main_thread(closure:@escaping ()->()) {
    let when = DispatchTime.now()
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

func setCornurRedius(_ idObject: UIView, radius: CGFloat) {
    idObject.layer.cornerRadius = radius;
    idObject.layer.masksToBounds = true
}

func setBorder(_ idObject: UIView, width: CGFloat, color:UIColor) {
    idObject.layer.borderWidth = width;
    idObject.layer.borderColor = color.cgColor;
    idObject.layer.masksToBounds = true
}

func isStringEmpty(_ string:String) -> Bool {
    
    let str = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    if str.length > 0 {
        return false
    }
    else {
        return true
    }
}
