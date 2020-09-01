//
//  String+extension.swift
//  Mandoub Services Platform
//
//  Created by Ashutosh Mishra on 22/04/19.
//  Copyright © 2019 Ashutosh Mishra. All rights reserved.
//

import Foundation

extension String {
    
    func isEmptyText() -> Bool {
        let finalText = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if finalText.isEmpty == true {
            return true
        } else {
            return false
        }
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        guard !self.lowercased().hasPrefix("mailto:") else { return false }
        guard let emailDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else { return false }
        let matches = emailDetector.matches(in: self, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange(location: 0, length: self.count))
        guard matches.count == 1 else { return false }
    
        return emailTest.evaluate(with: self) && matches[0].url?.scheme == "mailto"
    }
   
    func validatephone() -> Bool {
        let PHONE_REGEX = "(\\([0-9]{3}\\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
//    func isValidEmail() -> Bool {
////        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
////        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
////
////        guard !self.lowercased().hasPrefix("mailto:") else { return false }
////        guard let emailDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else { return false }
////        let matches = emailDetector.matches(in: self, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange(location: 0, length: self.count))
////        guard matches.count == 1 else { return false }
////
////        return emailTest.evaluate(with: self) && matches[0].url?.scheme == "mailto"
//        
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: self)
//    }
}

// check a valid phone number and make a call
extension String {
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool {
        return isValid(regex: regex.rawValue)
    }
    
    func isValid(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter{CharacterSet.decimalDigits.contains($0)}
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    /// Mark:- For Calling.
//    func makeACall() {
//        if isValid(regex: .phone) {
//            if let url = URL(string: "tel://\(self.onlyDigits())"), UIApplication.shared.canOpenURL(url) {
//                if #available(iOS 10, *) {
//                    UIApplication.shared.open(url)
//                } else {
//                    UIApplication.shared.openURL(url)
//                }
//            }
//        }
//    }
}
