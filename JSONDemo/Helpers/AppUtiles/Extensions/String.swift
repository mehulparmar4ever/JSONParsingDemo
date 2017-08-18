//
//  String.swift
//  RealPlans
//
//  Created by Bhuvan on 26/02/16.
//  Copyright © 2017 Sooryen Innovation labs Studio. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func stringByReplacing(replaceStrings set: [String], with: String) -> String {
        var stringObject = self
        for string in set {
            stringObject = self.replacingOccurrences(of: string, with:with)
        }
        return stringObject
    }
    
    func replace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func dropLast(_ n: Int = 1) -> String {
        return String(characters.dropLast(n))
    }
    
    var dropLast: String {
        return dropLast()
    }
    
    func convertStrToDate () -> Date {
        
        // Destination format :
        let dateDestinationFormat = DateFormatter()
        dateDestinationFormat.dateFormat = "dd-MM-yyyy"
        dateDestinationFormat.timeZone = TimeZone.current

        // Convert current String Date to NSDate
        let dateFromString = dateDestinationFormat.date(from: self)
        return dateFromString!
    }
    
    func convertStrToDate(_ dateFormat : String) -> Date
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = dateFormat
        
        //Parse into NSDate
        let dateFromString : Date = dateFormatter.date(from: self)!
        
        //Return Parsed Date
        return dateFromString
    }
    
    func convertDatetoString (_ dateFormat : String) -> Date! {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = dateFormat
        dateStringFormatter.timeZone = TimeZone.current
        let date = dateStringFormatter.date(from: self)
        return date
    }
    
    func convertFormatOfDate(_ originalFormat: String, destinationFormat: String) -> String! {
        
        // Orginal format :
        let dateOriginalFormat = DateFormatter()
        dateOriginalFormat.dateFormat = originalFormat      // in the example it'll take "yy MM dd" (from our call)
                // Destination format :
        let dateDestinationFormat = DateFormatter()
        dateDestinationFormat.dateFormat = destinationFormat // in the example it'll take "EEEE dd MMMM yyyy" (from our call)
        
        // Convert current String Date to NSDate
        let dateFromString = dateOriginalFormat.date(from: self)
        
        // Convert new NSDate created above to String with the good format
        let dateFormated = dateDestinationFormat.string(from: dateFromString!)
        
        return dateFormated
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidEmail1() -> Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
    
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    func EncodingSmileyText()-> String {
        
        //        let encodedString = NSString.init(data: self.dataUsingEncoding(NSNonLossyASCIIStringEncoding, allowLossyConversion: false)!, encoding: NSUTF8StringEncoding)
        
        let encodedString = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        return encodedString!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
    }
    
    func DecodeSmileyText()-> String {
        
        //        let encodedString = NSString.init(data: self.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, encoding: NSNonLossyASCIIStringEncoding)
        
        let data = Data(base64Encoded: self, options: NSData.Base64DecodingOptions(rawValue: 0))
        return String(data: data!, encoding: String.Encoding.utf8)!
    }
    
    func stringByAppendingPathComponent(_ path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
    
    func removeWhiteSpace() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func replace(_ target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
    
    func getHeightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    func isValidPostalCode() -> Bool {
        do {//  /[A-Z]{1,2}[0-9]{1,2}\s?[0-9]{1,2}[A-Z]{1,2}/i
            let regex = try NSRegularExpression(pattern: "[A-Z]{1,2}[0-9]{1,2}\\s[0-9]{1,2}[A-Z]{1,2}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = data(using: String.Encoding.utf8)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:String.Encoding.utf8], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    var length: Int {
        return characters.count
    }
    
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    func randomStringWithLength (_ len : Int) -> String {
    
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in (0..<len) {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let newCharacter = allowedChars[allowedChars.characters.index(allowedChars.startIndex, offsetBy: randomNum)]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
    
    func randomIntgerWithLength (_ len : Int) -> String {
        
        let allowedChars = "0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in (0..<len) {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let newCharacter = allowedChars[allowedChars.characters.index(allowedChars.startIndex, offsetBy: randomNum)]
            randomString += String(newCharacter)
        }
        
        return randomString
    }

    
    func uniqueIdentifier () -> String {
        return UUID().uuidString.replacingOccurrences(of: "-", with: "_", options: NSString.CompareOptions.literal, range: nil)
    }
    
    //NEw added code
    /// EZSE: Init string with a base64 encoded string
    init ? (base64: String) {
        let pad = String(repeating: "=", count: base64.length % 4)
        let base64Padded = base64 + pad
        if let decodedData = Data(base64Encoded: base64Padded, options: NSData.Base64DecodingOptions(rawValue: 0)), let decodedString = NSString(data: decodedData, encoding: String.Encoding.utf8.rawValue) {
            self.init(decodedString)
            return
        }
        return nil
    }
    
    /// EZSE: base64 encoded of string
    var base64: String {
        let plainData = (self as NSString).data(using: String.Encoding.utf8.rawValue)
        let base64String = plainData!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return base64String
    }
    
    /// EZSE: Cut string from integerIndex to the end
    public subscript(integerIndex: Int) -> Character {
        let index = characters.index(startIndex, offsetBy: integerIndex)
        return self[index]
    }
    
    /// EZSE: Cut string from range
    public subscript(integerRange: Range<Int>) -> String {
        let start = characters.index(startIndex, offsetBy: integerRange.lowerBound)
        let end = characters.index(startIndex, offsetBy: integerRange.upperBound)
        return self[start..<end]
    }
    
    /// EZSE: Cut string from closedrange
    public subscript(integerClosedRange: ClosedRange<Int>) -> String {
        return self[integerClosedRange.lowerBound..<(integerClosedRange.upperBound + 1)]
    }
    
    /// EZSE: Counts number of instances of the input inside String
    public func count(_ substring: String) -> Int {
        return components(separatedBy: substring).count - 1
    }
    
    /// EZSE: Capitalizes first character of String
    public mutating func capitalizeFirst() {
        guard characters.count > 0 else { return }
        self.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).capitalized)
    }
    
    /// EZSE: Capitalizes first character of String, returns a new string
    public func capitalizedFirst() -> String {
        guard characters.count > 0 else { return self }
        var result = self
        
        result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).capitalized)
        return result
    }
    
    /// EZSE: Uppercases first 'count' characters of String
    public mutating func uppercasePrefix(_ count: Int) {
        guard characters.count > 0 && count > 0 else { return }
        self.replaceSubrange(startIndex..<self.index(startIndex, offsetBy: min(count, length)),
                             with: String(self[startIndex..<self.index(startIndex, offsetBy: min(count, length))]).uppercased())
    }
    
    /// EZSE: Uppercases first 'count' characters of String, returns a new string
    public func uppercasedPrefix(_ count: Int) -> String {
        guard characters.count > 0 && count > 0 else { return self }
        var result = self
        result.replaceSubrange(startIndex..<self.index(startIndex, offsetBy: min(count, length)),
                               with: String(self[startIndex..<self.index(startIndex, offsetBy: min(count, length))]).uppercased())
        return result
    }
    
    /// EZSE: Uppercases last 'count' characters of String
    public mutating func uppercaseSuffix(_ count: Int) {
        guard characters.count > 0 && count > 0 else { return }
        self.replaceSubrange(self.index(endIndex, offsetBy: -min(count, length))..<endIndex,
                             with: String(self[self.index(endIndex, offsetBy: -min(count, length))..<endIndex]).uppercased())
    }
    
    /// EZSE: Uppercases last 'count' characters of String, returns a new string
    public func uppercasedSuffix(_ count: Int) -> String {
        guard characters.count > 0 && count > 0 else { return self }
        var result = self
        result.replaceSubrange(characters.index(endIndex, offsetBy: -min(count, length))..<endIndex,
                               with: String(self[characters.index(endIndex, offsetBy: -min(count, length))..<endIndex]).uppercased())
        return result
    }
    
    /// EZSE: Uppercases string in range 'range' (from range.startIndex to range.endIndex)
    public mutating func uppercase(range: CountableRange<Int>) {
        let from = max(range.lowerBound, 0), to = min(range.upperBound, length)
        guard characters.count > 0 && (0..<length).contains(from) else { return }
        self.replaceSubrange(self.index(startIndex, offsetBy: from)..<self.index(startIndex, offsetBy: to),
                             with: String(self[self.index(startIndex, offsetBy: from)..<self.index(startIndex, offsetBy: to)]).uppercased())
    }
    
    /// EZSE: Uppercases string in range 'range' (from range.startIndex to range.endIndex), returns new string
    public func uppercased(range: CountableRange<Int>) -> String {
        let from = max(range.lowerBound, 0), to = min(range.upperBound, length)
        guard characters.count > 0 && (0..<length).contains(from) else { return self }
        var result = self
        result.replaceSubrange(characters.index(startIndex, offsetBy: from)..<characters.index(startIndex, offsetBy: to),
                               with: String(self[characters.index(startIndex, offsetBy: from)..<characters.index(startIndex, offsetBy: to)]).uppercased())
        return result
    }
    
    /// EZSE: Lowercases first character of String
    public mutating func lowercaseFirst() {
        guard characters.count > 0 else { return }
        self.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).lowercased())
    }
    
    /// EZSE: Lowercases first character of String, returns a new string
    public func lowercasedFirst() -> String {
        guard characters.count > 0 else { return self }
        var result = self
        result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).lowercased())
        return result
    }
    
    /// EZSE: Lowercases first 'count' characters of String
    public mutating func lowercasePrefix(_ count: Int) {
        guard characters.count > 0 && count > 0 else { return }
        self.replaceSubrange(startIndex..<self.index(startIndex, offsetBy: min(count, length)),
                             with: String(self[startIndex..<self.index(startIndex, offsetBy: min(count, length))]).lowercased())
    }
    
    /// EZSE: Lowercases first 'count' characters of String, returns a new string
    public func lowercasedPrefix(_ count: Int) -> String {
        guard characters.count > 0 && count > 0 else { return self }
        var result = self
        result.replaceSubrange(startIndex..<characters.index(startIndex, offsetBy: min(count, length)),
                               with: String(self[startIndex..<characters.index(startIndex, offsetBy: min(count, length))]).lowercased())
        return result
    }
    
    /// EZSE: Lowercases last 'count' characters of String
    public mutating func lowercaseSuffix(_ count: Int) {
        guard characters.count > 0 && count > 0 else { return }
        self.replaceSubrange(self.index(endIndex, offsetBy: -min(count, length))..<endIndex,
                             with: String(self[self.index(endIndex, offsetBy: -min(count, length))..<endIndex]).lowercased())
    }
    
    /// EZSE: Lowercases last 'count' characters of String, returns a new string
    public func lowercasedSuffix(_ count: Int) -> String {
        guard characters.count > 0 && count > 0 else { return self }
        var result = self
        result.replaceSubrange(characters.index(endIndex, offsetBy: -min(count, length))..<endIndex,
                               with: String(self[characters.index(endIndex, offsetBy: -min(count, length))..<endIndex]).lowercased())
        return result
    }
    
    /// EZSE: Lowercases string in range 'range' (from range.startIndex to range.endIndex)
    public mutating func lowercase(range: CountableRange<Int>) {
        let from = max(range.lowerBound, 0), to = min(range.upperBound, length)
        guard characters.count > 0 && (0..<length).contains(from) else { return }
        self.replaceSubrange(self.index(startIndex, offsetBy: from)..<self.index(startIndex, offsetBy: to),
                             with: String(self[self.index(startIndex, offsetBy: from)..<self.index(startIndex, offsetBy: to)]).lowercased())
    }
    
    /// EZSE: Lowercases string in range 'range' (from range.startIndex to range.endIndex), returns new string
    public func lowercased(range: CountableRange<Int>) -> String {
        let from = max(range.lowerBound, 0), to = min(range.upperBound, length)
        guard characters.count > 0 && (0..<length).contains(from) else { return self }
        var result = self
        result.replaceSubrange(characters.index(startIndex, offsetBy: from)..<characters.index(startIndex, offsetBy: to),
                               with: String(self[characters.index(startIndex, offsetBy: from)..<characters.index(startIndex, offsetBy: to)]).lowercased())
        return result
    }
    
    /// EZSE: Counts whitespace & new lines
    @available(*, deprecated: 1.6, renamed: "isBlank")
    public func isOnlyEmptySpacesAndNewLineCharacters() -> Bool {
        let characterSet = CharacterSet.whitespacesAndNewlines
        let newText = self.trimmingCharacters(in: characterSet)
        return newText.isEmpty
    }
    
    
    /// EZSE: Trims white space and new line characters
    public mutating func trim() {
        self = self.trimmed()
    }
    
    /// EZSE: Trims white space and new line characters, returns a new string
    public func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// EZSE: Position of begining character of substing
    public func positionOfSubstring(_ subString: String, caseInsensitive: Bool = false, fromEnd: Bool = false) -> Int {
        if subString.isEmpty {
            return -1
        }
        var searchOption = fromEnd ? NSString.CompareOptions.anchored : NSString.CompareOptions.backwards
        if caseInsensitive {
            searchOption.insert(NSString.CompareOptions.caseInsensitive)
        }
        if let range = self.range(of: subString, options: searchOption), !range.isEmpty {
            return self.characters.distance(from: self.startIndex, to: range.lowerBound)
        }
        return -1
    }
    
    /// EZSE: split string using a spearator string, returns an array of string
    public func split(_ separator: String) -> [String] {
        return self.components(separatedBy: separator).filter {
            !$0.trimmed().isEmpty
        }
    }
    
    /// EZSE: split string with delimiters, returns an array of string
    public func split(_ characters: CharacterSet) -> [String] {
        return self.components(separatedBy: characters).filter {
            !$0.trimmed().isEmpty
        }
    }
    
    /// EZSE : Returns count of words in string
    public var countofWords: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+", options: NSRegularExpression.Options())
        return regex?.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: self.length)) ?? 0
    }
    
    /// EZSE : Returns count of paragraphs in string
    public var countofParagraphs: Int {
        let regex = try? NSRegularExpression(pattern: "\\n", options: NSRegularExpression.Options())
        let str = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return (regex?.numberOfMatches(in: str, options: NSRegularExpression.MatchingOptions(), range: NSRange(location:0, length: str.length)) ?? -1) + 1
    }
    
    internal func rangeFromNSRange(_ nsRange: NSRange) -> Range<String.Index>? {
        let from16 = utf16.startIndex.advanced(by: nsRange.location)
        let to16 = from16.advanced(by: nsRange.length)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }
    
    /// EZSE: Find matches of regular expression in string
    public func matchesForRegexInText(_ regex: String!) -> [String] {
        let regex = try? NSRegularExpression(pattern: regex, options: [])
        let results = regex?.matches(in: self, options: [], range: NSRange(location: 0, length: self.length)) ?? []
        return results.map { self.substring(with: self.rangeFromNSRange($0.range)!) }
    }
    
    /// EZSE: Checks if String contains Email
    public var isEmail: Bool {
        let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let firstMatch = dataDetector?.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange(location: 0, length: length))
        return (firstMatch?.range.location != NSNotFound && firstMatch?.url?.scheme == "mailto")
    }
    
    /// EZSE: Returns if String is a number
    public func isNumber() -> Bool {
        if let _ = NumberFormatter().number(from: self) {
            return true
        }
        return false
    }
    
    /// EZSE: Extracts URLS from String
    public var extractURLs: [URL] {
        var urls: [URL] = []
        let detector: NSDataDetector?
        do {
            detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        } catch _ as NSError {
            detector = nil
        }
        
        let text = self
        
        if let detector = detector {
            detector.enumerateMatches(in: text, options: [], range: NSRange(location: 0, length: text.characters.count), using: {
                (result: NSTextCheckingResult?, flags: NSRegularExpression.MatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                if let result = result, let url = result.url {
                    urls.append(url)
                }
            })
        }
        
        return urls
    }
    
    /// EZSE: Checking if String contains input with comparing options
    public func contains(_ find: String, compareOption: NSString.CompareOptions) -> Bool {
        return self.range(of: find, options: compareOption) != nil
    }
    
    /// EZSE: Converts String to Int
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }
    
    var integer: Int { return Int(self) ?? 0 }

    /// EZSE: Converts String to Double
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    /// EZSE: Converts String to Float
    public func toFloat() -> Float? {
        if let num = NumberFormatter().number(from: self) {
            return num.floatValue
        } else {
            return nil
        }
    }
    
    /// EZSE: Converts String to Bool
    public func toBool() -> Bool? {
        let trimmedString = trimmed().lowercased()
        if trimmedString == "true" || trimmedString == "false" {
            return (trimmedString as NSString).boolValue
        }
        
        if trimmedString == "1" {
            return true
        }
        else if trimmedString == "0" {
            return false
        }

        return nil
    }
    
    ///EZSE: Returns the first index of the occurency of the character in String
    public func getIndexOf(_ char: Character) -> Int? {
        for (index, c) in characters.enumerated() {
            if c == char {
                return index
            }
        }
        return nil
    }
    
    /// EZSE: Converts String to NSString
    public var toNSString: NSString { get { return self as NSString } }
    
    #if os(iOS)
    
    ///EZSE: Returns bold NSAttributedString
    public func bold() -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont().Bold(UIFont.systemFontSize)])
    }
    
    #endif
    
    ///EZSE: Returns underlined NSAttributedString
    public func underline() -> NSAttributedString {
        let underlineString = NSAttributedString(string: self, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
        return underlineString
    }
    
    #if os(iOS)
    
    ///EZSE: Returns italic NSAttributedString
    public func italic() -> NSAttributedString {
        let italicString = NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
        return italicString
    }
    
    #endif
    
    #if os(iOS)
    
    ///EZSE: Returns hight of rendered string
    /*
    func height(_ width: CGFloat, font: UIFont, lineBreakMode: NSLineBreakMode?) -> CGFloat {
        var attrib: [String: AnyObject] = [NSFontAttributeName: font]
        if lineBreakMode != nil {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode!
            attrib.updateValue(paragraphStyle, forKey: NSParagraphStyleAttributeName)
        }
        let size = CGSize(width: width, height: CGFloat(DBL_MAX))
        return ceil((self as NSString).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:attrib, context: nil).height)
    }*/
    
    #endif
    
    ///EZSE: Returns NSAttributedString
    public func color(_ color: UIColor) -> NSAttributedString {
        let colorString = NSMutableAttributedString(string: self, attributes: [NSForegroundColorAttributeName: color])
        return colorString
    }
    
    ///EZSE: Returns NSAttributedString
    public func colorSubString(_ subString: String, color: UIColor) -> NSMutableAttributedString {
        var start = 0
        var ranges: [NSRange] = []
        while true {
            let range = (self as NSString).range(of: subString, options: NSString.CompareOptions.literal, range: NSRange(location: start, length: (self as NSString).length - start))
            if range.location == NSNotFound {
                break
            } else {
                ranges.append(range)
                start = range.location + range.length
            }
        }
        let attrText = NSMutableAttributedString(string: self)
        for range in ranges {
            attrText.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
        }
        return attrText
    }
    
    /// EZSE: Checks if String contains Emoji
    public func includesEmoji() -> Bool {
        for i in 0...length {
            let c: unichar = (self as NSString).character(at: i)
            if (0xD800 <= c && c <= 0xDBFF) || (0xDC00 <= c && c <= 0xDFFF) {
                return true
            }
        }
        return false
    }
    
    #if os(iOS)
    
    /// EZSE: copy string to pasteboard
    public func addToPasteboard() {
        let pasteboard = UIPasteboard.general
        pasteboard.string = self
    }
    
    #endif
    
    // EZSE: URL encode a string (percent encoding special chars)
    public func urlEncoded() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    // EZSE: URL encode a string (percent encoding special chars) mutating version
    mutating func urlEncode() {
        self = urlEncoded()
    }
    
    // EZSE: Removes percent encoding from string
    public func urlDecoded() -> String {
        return removingPercentEncoding ?? self
    }
    
    // EZSE : Mutating versin of urlDecoded
    mutating func urlDecode() {
        self = urlDecoded()
    }
    
    func toUTCDate(format: String) -> Date
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = format
        
        //Parse into NSDate
        let dateFromString : Date = dateFormatter.date(from: self)! as Date
        
        //Return Parsed Date
        return dateFromString
    }
    
    func toDate(format: String) -> Date
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current //NSTimeZone.local
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = format
        
        //Parse into NSDate
        let dateFromString : Date = dateFormatter.date(from: self)! as Date
        
        //Return Parsed Date
        return dateFromString
    }
    
    init(_ value: Float, precision: Int) {
        let nFormatter = NumberFormatter()
        nFormatter.numberStyle = .decimal
        nFormatter.maximumFractionDigits = precision
        self = nFormatter.string(from: NSNumber(value: value))!
    }
    
    init(_ value: Double, precision: Int) {
        let nFormatter = NumberFormatter()
        nFormatter.numberStyle = .decimal
        nFormatter.maximumFractionDigits = precision
        self = nFormatter.string(from: NSNumber(value: value))!
    }
}

/// EZSE: Pattern matching of strings via defined functions
public func ~=<T> (pattern: ((T) -> Bool), value: T) -> Bool {
    return pattern(value)
}

/// EZSE: Can be used in switch-case
public func hasPrefix(_ prefix: String) -> (_ value: String) -> Bool {
    return { (value: String) -> Bool in
        value.hasPrefix(prefix)
    }
}

/// EZSE: Can be used in switch-case
public func hasSuffix(_ suffix: String) -> (_ value: String) -> Bool {
    return { (value: String) -> Bool in
        value.hasSuffix(suffix)
    }
}

extension Character {
    fileprivate func isEmoji() -> Bool {
        return Character(UnicodeScalar(UInt32(0x1d000))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1f77f))!)
            || Character(UnicodeScalar(UInt32(0x2100))!) <= self && self <= Character(UnicodeScalar(UInt32(0x26ff))!)
    }
}

extension Double {
    var to2DecimalString:String {
        return String(format: "%.2f", self)
    }
}

extension String {
    func stringByRemovingEmoji() -> String {
        return String(self.characters.filter { !$0.isEmoji() })
    }
}

extension String {
    func containsEmoji() -> Bool {
        for i in self.characters {
            if i.isEmoji() {
                return true
            }
        }
        return false
    }
}
