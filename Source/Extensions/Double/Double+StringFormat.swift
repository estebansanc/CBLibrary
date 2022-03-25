//
//  Double+StringFormat.swift
//  tunki-user
//
//  Created by Alexis Gonzalo Quarin on 29/10/2019.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

extension Double {

    func toString() -> String {
        return String(format: "%.2f", self)
    }
    
    func getCurrencyFormat() -> String {
        return self.toString().currencyInputFormatting()
    }

	func getIntegerString() -> String {
		return String(format: "%.0f", self)
	}
    
    func roundToPlaces(places: Int, rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded(rule) / divisor
    }
}
