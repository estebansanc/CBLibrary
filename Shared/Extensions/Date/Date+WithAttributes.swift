//
//  Date+WithAttributes.swift
//  QualityControl
//
//  Created by Esteban Sánchez on 10/03/2022.
//

import Foundation

extension Date {
    func withAttributes(hour: Int, minute: Int, second: Int) -> Date {
        return Calendar.current.date(bySettingHour: hour, minute: minute, second: second, of: self)!
    }
    
    func withAttributes(minute: Int, second: Int) -> Date {
        let hour = Calendar.current.component(.hour, from: self)
        return Calendar.current.date(bySettingHour: hour, minute: minute, second: second, of: self)!
    }
    
    func hasMinutesOrSeconds() -> Bool {
        let minute = Calendar.current.component(.minute, from: self)
        let second = Calendar.current.component(.second, from: self)
        return minute != 0 && second != 0
    }
}
