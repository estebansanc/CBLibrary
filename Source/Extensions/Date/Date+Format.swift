//
//  Date+Format.swift
//  tunki-user
//
//  Created by Alexis Gonzalo Quarin on 23/10/2019.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

extension Date {
    
    func getTimeStampInMiliseconds() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }

	func getTimeStamp() -> Int64 {
		return Int64(self.timeIntervalSince1970)
	}
    
    static func getFromLong(interval: Int64) -> Date {
        let timeInterval = TimeInterval(interval)
        return Date(timeIntervalSince1970: timeInterval)
    }

    static func getFromMiliseconds(milliseconds: Int64) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    func getHourFormat() -> String {
        return getDateHour(format: "HH:mm")
    }
    
    func getDateFormat() -> String {
        return getDateHour(format: "dd/MM/yyyy")
    }

    func getDayMonthFormat() -> String {
        return getDateHour(format: "dd/MM")
    }

	func getMonthYearFormat() -> String {
		return getDateHour(format: "MMMM yyyy").capitalized
	}

    func getDateHour(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "es_PE")
        
        return formatter.string(from: self)
    }
    
    func getDateHour(format: String, timeZone: TimeZone = TimeZone.current) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timeZone
        formatter.locale = Locale(identifier: "es_PE")
        
        return formatter.string(from: self)
    }
    
    func formatWithMonth() -> String {
        let calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                 from: self)
        
        let months = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Set", "Oct", "Nov", "Dic"]
        
        let day = components.day ?? 0
        let month = (components.month ?? 1) - 1
        
        return String(format: "%02d %@", day, months[month])
    }

	func getEndDayCurrentMonth() -> Date {
		let calendar = Calendar.current
		var components = DateComponents()
		components.month = 1
		components.day = -1

		return calendar.date(byAdding: components, to: self) ?? Date()
	}
}
