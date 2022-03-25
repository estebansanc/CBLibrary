//
//  String+CurrrencyFormat.swift
//  tunki-user
//
//  Created by Alexis Gonzalo Quarin on 23/10/2019.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

extension String {

    /// Formatting text for currency textField
    /// - Returns: S/ 100.00
    func currencyInputFormatting() -> String {
        return getFormatting(amount: self.getCurrencyNumberOnly())
    }
    
    /// Formatting text for currency textField
    /// - Returns: S/ 100
    func currencyInputWithoutDecimalFormatting() -> String {
        return getFormatting(amount: self.getCurrencyIntegerNumberOnly(), decimalDigits: 0)
    }
    
    private func getFormatting(amount: Double, decimalDigits: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "S/"
        formatter.locale = Locale(identifier: "es_PE")
        
        formatter.decimalSeparator = "."
        formatter.groupingSeparator = ","
        
        formatter.maximumFractionDigits = decimalDigits
        formatter.minimumFractionDigits = decimalDigits
        
        let number = NSNumber(value: amount)
        
        if let stringFormatted = formatter.string(from: number) {
            return stringFormatted
        }
        
        return formatter.currencySymbol
    }
    
    func getCurrencyNumberOnly() -> Double {
        let range = NSRange(location: 0, length: self.count)
        let regex = try? NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        let amountWithPrefix = regex?.stringByReplacingMatches(in: self,
                                                               options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                                               range: range, withTemplate: emptyString) ?? emptyString
        
        return (amountWithPrefix as NSString).doubleValue / 100
    }

	func getDecimalNumber() -> Decimal {
		let onlyNumber = self.getDecimalString()
		return Decimal(string: onlyNumber) ?? 0
	}
    
    func getCurrencyIntegerNumberOnly() -> Double {
        let range = NSRange(location: 0, length: self.count)
        let regex = try? NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        let amountWithPrefix = regex?.stringByReplacingMatches(in: self,
                                                               options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                                               range: range, withTemplate: emptyString) ?? emptyString
        
        return (amountWithPrefix as NSString).doubleValue
    }
    
    func getDecimalString() -> String {
        return String(format: "%.2f", self.getCurrencyNumberOnly())
    }
    
    func getWithoutDecimalString() -> String {
        return String(format: "%.f", self.getCurrencyIntegerNumberOnly())
    }
    
    func trimLeading() -> String {
        return self.replacingOccurrences(of: "^\\s+", with: "", options: .regularExpression)
    }
    
    func trimAllWhiteSpacesAndNewLines() -> String {
        return String(self.filter { !" \n\t\r".contains($0) })
    }
    
    func getOnlyNumbers() -> String {
        let range = NSRange(location: 0, length: self.count)
        let regex = try? NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        let numbers = regex?.stringByReplacingMatches(in: self,
                                                      options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                                      range: range, withTemplate: emptyString)
        
        return numbers ?? emptyString
    }

	func capitalizingFirstLetter() -> String {
		let lowercassed = lowercased()
		return lowercased().prefix(1).capitalized + dropFirst()
	}

	func toUIColor () -> UIColor {
		var cString:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

		if (cString.hasPrefix("#")) {
			cString.remove(at: cString.startIndex)
		}

		if ((cString.count) != 6) {
			return UIColor.gray
		}

		var rgbValue:UInt64 = 0
		Scanner(string: cString).scanHexInt64(&rgbValue)

		return UIColor(
			red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha: CGFloat(1.0)
		)
	}
}
