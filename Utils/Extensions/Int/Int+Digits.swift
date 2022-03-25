//
//  Int+Digits.swift
//  tunki-user
//
//  Created by Esteban Sánchez on 11/11/2021.
//  Copyright © 2021 InDigital. All rights reserved.
//

import Foundation

extension Int64 {
    /// returns number of digits in Int number
    public var digitCount: Int64 {
        get {
            return numberOfDigits(in: self)
        }
    }
    
    // private recursive method for counting digits
    private func numberOfDigits(in number: Int64) -> Int64 {
        if number < 10 && number >= 0 || number > -10 && number < 0 {
            return 1
        } else {
            return 1 + numberOfDigits(in: number/10)
        }
    }
}
