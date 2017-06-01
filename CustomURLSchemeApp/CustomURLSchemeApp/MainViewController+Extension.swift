//
//  MainViewController+Extension.swift
//  CustomURLSchemeApp
//
//  Created by Zoran Todorovic on 01/06/2017.
//  Copyright © 2017 Zoran Todorovic. All rights reserved.
//

import Foundation
import UIKit


// Validation extension

extension MainViewController {
    
    func isValidEmail(value: String) -> Bool {
        let emailRegEx = "[a-z0-9!#$%&'*+/=?^&#95;`{|}~-]+(?:.[a-z0-9!#$%&'*+/=?^&#95;`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
        return NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: value)
    }
    
    func isURL(value: String) -> Bool {
        let urlRegEx = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: value)
    }
    
    func isPhoneNumber(value: String) -> Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: value, options: [], range: NSMakeRange(0, value.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == value.characters.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func isBase64(value: String) -> Bool {
        let encoded = Data(value.utf8).base64EncodedString()
        if Data(base64Encoded: encoded, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) != nil {
            return true
        } else {
            return false
        }
    }
    
}
