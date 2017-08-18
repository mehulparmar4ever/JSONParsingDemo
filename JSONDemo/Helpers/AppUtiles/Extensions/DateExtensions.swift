//
//  DateExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension Date {
    func getValidTillDate() -> Date {
        var date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.year, .month, .day, .hour, .minute, .second], from: self, to: date, options: [])
        
        //Check
        if components.year! < 0 {
            date = date.plus(days: 2)
        } else if components.month! < 0 {
            date = date.plus(days: 2)
        } else if components.day! < 0 {
            date = date.plus(days: 2)
        }
        else {
            if components.hour! < 0 {
                if (components.hour! < -12 && components.hour! >= -24) {
                    date = date.plus(days: 1)
                }
                else if components.hour! >= -12 {
                    date = date.addComponentsToDate(seconds: 0, minutes: 0, hours: 4, days: 0, weeks: 0, months: 0, years: 0)
                }
            }
            else {
                date = date.addComponentsToDate(seconds: 0, minutes: 0, hours: 4, days: 0, weeks: 0, months: 0, years: 0)
            }
        }
        
        return date
    }
    
    public func plus(days d: UInt) -> Date {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: Int(d), weeks: 0, months: 0, years: 0)
    }
    
    public func addComponentsToDate(seconds sec: Int, minutes min: Int, hours hrs: Int, days d: Int, weeks wks: Int, months mts: Int, years yrs: Int) -> Date {
        var dc = DateComponents()
        dc.second = sec
        dc.minute = min
        dc.hour = hrs
        dc.day = d
        dc.weekOfYear = wks
        dc.month = mts
        dc.year = yrs
        return Calendar.current.date(byAdding: dc, to: self)!
    }
    
    public static let minutesInAWeek = 24 * 60 * 7

    /// EZSE: Initializes Date from string and format
    public init?(fromString string: String, format: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let date = formatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }

    /// EZSE: Initializes Date from string returned from an http response, according to several RFCs
    public init? (httpDateString: String) {
        if let rfc1123 = Date(fromString: httpDateString, format: "EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss zzz") {
            self = rfc1123
            return
        }
        if let rfc850 = Date(fromString: httpDateString, format: "EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z") {
            self = rfc850
            return
        }
        if let asctime =  Date(fromString: httpDateString, format: "EEE MMM d HH':'mm':'ss yyyy") {
            self = asctime
            return
        }
        //self.init()
        return nil
    }

    /// EZSE: Converts Date to String
    public func toString(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }
    /// EZSE: Converts Date to String, with format
    public func toUTCString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    /// EZSE: Converts Date to String, with format
    public func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current

        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    /// EZSE: Calculates how many days passed from now to date
    public func daysInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff/86400)
        return diff
    }

    /// EZSE: Calculates how many hours passed from now to date
    public func hoursInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff/3600)
        return diff
    }

    /// EZSE: Calculates how many minutes passed from now to date
    public func minutesInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff/60)
        return diff
    }

    /// EZSE: Calculates how many seconds passed from now to date
    public func secondsInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff)
        return diff
    }

    /// EZSE: Easy creation of time passed String. Can be Years, Months, days, hours, minutes or seconds
    public func timePassed() -> String {
        let date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.year, .month, .day, .hour, .minute, .second], from: self, to: date, options: [])
        var str: String

        if components.year! >= 1 {
            components.year == 1 ? (str = "year") : (str = "years")
            return "\(String(describing: components.year)) \(str) ago"
        } else if components.month! >= 1 {
            components.month == 1 ? (str = "month") : (str = "months")
            return "\(String(describing: components.month)) \(str) ago"
        } else if components.day! >= 1 {
            components.day == 1 ? (str = "day") : (str = "days")
            return "\(String(describing: components.day)) \(str) ago"
        } else if components.hour! >= 1 {
            components.hour == 1 ? (str = "hour") : (str = "hours")
            return "\(String(describing: components.hour)) \(str) ago"
        } else if components.minute! >= 1 {
            components.minute == 1 ? (str = "minute") : (str = "minutes")
            return "\(String(describing: components.minute)) \(str) ago"
        } else if components.second == 0 {
            return "Just now"
        } else {
            return "\(String(describing: components.second)) seconds ago"
        }
    }
    
    /// EZSE: Check if date is in future.
    public var isFuture: Bool {
        return self > Date()
    }
    
    /// EZSE: Check if date is in past.
    public var isPast: Bool {
        return self < Date()
    }

    // EZSE: Check date if it is today
    public var isToday: Bool {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.string(from: self) == format.string(from: Date())
    }

    /// EZSE: Check date if it is yesterday
    public var isYesterday: Bool {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let yesterDay = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        return format.string(from: self) == format.string(from: yesterDay!)
    }

    /// EZSE: Check date if it is tomorrow
    public var isTomorrow: Bool {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        return format.string(from: self) == format.string(from: tomorrow!)
    }

    /// EZSE: Check date if it is within this month.
    public var isThisMonth: Bool {
        let today = Date()
        return self.month == today.month && self.year == today.year
    }

    public var isThisWeek: Bool {
        return self.minutesInBetweenDate(Date()) <= Double(Date.minutesInAWeek)
    }

    // EZSE : Get the year from the date
    public var year: Int {
        return NSCalendar.current.component(Calendar.Component.year, from: self)
    }

    // EZSE : Get the month from the date
    public var month: Int {
        return NSCalendar.current.component(Calendar.Component.month, from: self)
    }

    // EZSE : Get the weekday from the date
    public var weekday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }

    // EZSE : Get the month from the date
    public var monthAsString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }

    // EZSE : Get the day from the date
    public var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    /// EZSE: Get the hours from date
    public var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }

    /// EZSE: Get the minute from date
    public var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }

    /// EZSE: Get the second from the date
    public var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    /// EZSE : Gets the nano second from the date
    public var nanosecond : Int {
        return Calendar.current.component(.nanosecond, from: self)
    }
}
