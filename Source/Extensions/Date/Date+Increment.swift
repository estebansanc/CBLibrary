//
//  Date+Increment.swift
//  QualityControl
//
//  Created by Esteban Sánchez on 08/03/2022.
//

import Foundation

extension Date {
    func incrementHours(_ quantity: Int) -> Date? {
        return Calendar.current.date(byAdding: .hour, value: quantity, to: self)
    }
    
    func incrementDays(_ quantity: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: quantity, to: self)
    }
    
    static func getHoursBetween(beginDate: Date, endDate: Date) -> Int? {
        let dateComponents = Calendar.current.dateComponents([.hour], from: beginDate, to: endDate)
        return dateComponents.hour
    }
}
