//
//  Date.swift
//  IOSHelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

public extension Date {
    
    func timeAgoSinceDate(_ currentDate: Date = Date(), numericDates:Bool = false) -> (String, Bool) {
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = currentDate
        let earliest = (now as NSDate).earlierDate(self)
        let latest = (earliest == now) ? self : now
        let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
        
        var dateStr = ""
        if (components.year! >= 2) {
            dateStr = "\(components.year!) years ago"
        } else if (components.year! >= 1){
            if (numericDates){
                dateStr = "1 year ago"
            } else {
                dateStr = "Last year"
            }
        } else if (components.month! >= 2) {
            dateStr = "\(components.month!) months ago"
        } else if (components.month! >= 1){
            if (numericDates){
                dateStr = "1 month ago"
            } else {
                dateStr = "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            dateStr = "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                dateStr = "1 week ago"
            } else {
                dateStr = "Last week"
            }
        } else if (components.day! >= 2) {
            dateStr = "\(components.day!) days ago"
        } else if (components.day! >= 1){
            if (numericDates){
                dateStr = "1 day ago"
            } else {
                dateStr = "Yesterday"
            }
        } else if (components.hour! >= 2) {
            dateStr = "\(components.hour!) hours ago"
        } else if (components.hour! >= 1){
            if (numericDates){
                dateStr = "1 hour ago"
            } else {
                dateStr = "An hour ago"
            }
        } else if (components.minute! >= 2) {
            dateStr = "\(components.minute!) minutes ago"
        } else if (components.minute! >= 1){
            if (numericDates){
                dateStr = "1 minute ago"
            } else {
                dateStr = "A minute ago"
            }
        } else if (components.second! >= 3) {
            dateStr = "\(components.second!) seconds ago"
        } else {
            dateStr = "Just now"
        }
        
        dateStr = (earliest == now) ? (dateStr +  " Left") : (dateStr !=  "Just now"  ? "Late by " + dateStr : dateStr)
        
        return (dateStr, (earliest == now))
    }

    static var UTCTimeStringWithFractionalSecs: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: Date())
    }
}

public extension Date {
    func isGreaterThanDate(_ dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func addMinutes(_ minutesToAdd: Int) -> Date {
        let secondsInMinutes: TimeInterval = Double(minutesToAdd) * 60
        let dateWithMinutesAdded: Date = self.addingTimeInterval(secondsInMinutes) as Date
        
        //Return Result
        return dateWithMinutesAdded
    }
}

public extension Date {
    
    func checkYear() -> Bool {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        
        let currentYear = formatter.string(from: date)
        let selectedYear = formatter.string(from: self)
        
        if Int(currentYear) == Int(selectedYear) {
            return true
        }
        
        return false
    }
    
    func getDetailedDate() -> String {
        return self.convert("dd MMM yyyy hh:mm a")
    }
    
    func convert(_ format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
        
    }
    
    func feedDateToString() -> String {
        var format = ""
        if isInSameDay() {
            format = "hh:mm a"
        } else if isInSameYear() {
            format = "d MMM hh:mm a"
        } else {
            format = "d MMM yy"
        }
        return self.convert(format)
        
    }
    
    func isInSameWeek() -> Bool {
        return Calendar.current.isDate(self, equalTo: Date(), toGranularity: .weekOfYear)
    }
    func isInSameMonth() -> Bool {
        return Calendar.current.isDate(self, equalTo: Date(), toGranularity: .month)
    }
    func isInSameYear() -> Bool {
        return Calendar.current.isDate(self, equalTo: Date(), toGranularity: .year)
    }
    func isInSameDay() -> Bool {
        return Calendar.current.isDate(self, equalTo: Date(), toGranularity: .day)
    }
    var isInThisWeek: Bool {
        return isInSameWeek()
    }
    var isInToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    var isInTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    var isInTheFuture: Bool {
        return Date() < self
    }
    var isInThePast: Bool {
        return self < Date()
    }
}

