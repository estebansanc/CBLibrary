//
//  String+ValidateExpression.swift
//  tunki-user
//
//  Created by Rodrigo German Ferretty on 21/01/2021.
//  Copyright © 2021 InDigital. All rights reserved.
//

import Foundation

extension String {
    func isOnlyNumbers() -> Bool {
        let characterSet = CharacterSet(charactersIn: self)
        return CharacterSet.decimalDigits.isSuperset(of: characterSet)
    }
    func isAlphaNumeric() -> Bool {
        let characterSet = CharacterSet(charactersIn: self)
        return CharacterSet.alphanumerics.isSuperset(of: characterSet)
    }
    func isEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return NSRegularExpression(emailRegex).matches(self)
    }
    func isDni() -> Bool {
        let dniRegex = "^[\\d]{1,3}\\.?[\\d]{3,3}\\.?[\\d]{3,3}$"
        return NSRegularExpression(dniRegex).matches(self)
    }
    func isHexCode() -> Bool {
        let hexCodeRegex = "^#(([0-9a-fA-F]{2}){3}|([0-9a-fA-F]){3})$"
        return NSRegularExpression(hexCodeRegex).matches(self)
    }
    func isEmpty() -> Bool {
        return self == emptyString
    }
    func isNotEmpty() -> Bool {
        return self != emptyString
    }
}
