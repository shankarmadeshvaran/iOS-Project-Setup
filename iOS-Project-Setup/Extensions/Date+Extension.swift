//
//  Date+Extension.swift
//  iOS-Project-Setup
//
//  Created by Shankar on 23/07/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation

extension Date {
    func getMonthAndYear() -> String {
        return getMonth() + " " + getYear()
    }
    
    func getMonthDateYear() -> String {
        return getMonth() + " " + getDateValue() + ", " + getYear()
    }
    
    func getFormattedDate() -> String {
        return "\(getDate())" + " " + getMonth() + ", " + getYear()
    }
   
    func getMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    
    func getYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    
    func getDateValue() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    
    func getDate() -> Int {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return components.day!
    }
    
    func getWeekDay() -> Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    func isInWeekends() -> Bool {
        if (getWeekDay() == 1 || getWeekDay() == 7) {
            return true
        }
        return false
    }
    
    func getDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}

extension Date {
    static var today: Date { return Date() }
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayBeforeYesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    
    var get30DaysBeforeDate: Date {
        return Calendar.current.date(byAdding: .day, value: -30, to: noon)!
    }
    
    var getTimeByAdding15Hours: Date {
        return Calendar.current.date(byAdding: .hour, value: 15, to: self)!
    }
    
    var getTimeByAdding15Mins: Date {
        return Calendar.current.date(byAdding: .minute, value: 15, to: self)!
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
    
    func getDateBySubtract(days:Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -days, to: noon)!
    }
    
    var calendar: Calendar {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        return calendar
    }

    var currentHour: Int {
        return calendar.component(.hour, from: Date.today)
    }

    var currentMinute: Int {
        return calendar.component(.minute, from: Date.today)
    }

    var currentSecond: Int {
        return calendar.component(.second, from: Date.today)
    }
    
    func getCurrentTime() -> String {
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        let second = calendar.component(.second, from: self)
        
        return ("\(hour):\(minute):\(second)")
    }
}
