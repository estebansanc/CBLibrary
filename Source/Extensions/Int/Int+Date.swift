//
//  Int+Date.swift
//  tunki-user
//
//  Created by Alexis Gonzalo Quarin on 07/11/2019.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

extension Int64 {
    
    func getDateString() -> String {
        return Date.getFromLong(interval: self).getDateFormat()
    }
    
    func getDateMilisecondsString() -> String {
        return Date.getFromMiliseconds(milliseconds: self).getDateFormat()
    }

    func getDayMonthFromMilisecondsDate() -> String {
        return Date.getFromMiliseconds(milliseconds: self).getDayMonthFormat()
    }
    
    func getHour() -> String {
        return Date.getFromLong(interval: self).getHourFormat()
    }
    
    func getDateHour(format: String) -> String {
        return Date.getFromLong(interval: self).getDateHour(format: format)
    }
    
    func getDateHourMiliseconds(format: String) -> String {
        return Date.getFromMiliseconds(milliseconds: self).getDateHour(format: format)
    }
    
    func getDate() -> Date {
        return Date.getFromLong(interval: self)
    }
    
    func getDateMiliseconds() -> Date {
        return Date.getFromMiliseconds(milliseconds: self)
    }

	func formateToDateWithMonth() -> String {
		let calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
		let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second],
												 from: Date.getFromLong(interval: self))

		let months = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Set", "Oct", "Nov", "Dic"]

		let day = components.day ?? 0
		let month = (components.month ?? 1) - 1

		return String(format: "%02d %@", day, months[month])
	}

	func formatToDateWithHour() -> String {
		return self.getDateMiliseconds()
			.getDateHour(format: "dd MMM - HH:mm")
			.replacingOccurrences(of: pointString, with: emptyString)
	}
    
    func timestampToDate() -> Date {
        /// Seconds = 10 characters
        /// Milliseconds = 13 characters
        var value: Int64 = self
        
        if value.digitCount <= 10 {
            value = value * 1000
        }
        
        return value.getDateMiliseconds()
    }
}
