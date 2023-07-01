//
//  DateExtension.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 14/06/23.
//

import Foundation

extension Date {
    
    enum DayNight {
        case day
        case night
    }
    
    /// Checks if now id day or night given sunrise and suset time in Date object format.
    static func checkDateNight(sunrise: Date, sunset: Date, timezone: Double) -> DayNight {
        let date = Date.convertToLocalTime(utcTimeInSeconds: Date().timeIntervalSince1970, timezoneInSeconds: timezone)
        let previousMidnight = Calendar.current.startOfDay(for: date)
        if date >= previousMidnight && date < sunrise ||
            date > sunset {
            
            return .night
        }
        else {
            return .day
        }
    }
    
    /// Converts specified UTC time in local time by its timezone in seconds.
    static func convertToLocalTime(utcTimeInSeconds: Double, timezoneInSeconds: Double) -> Date {
        
        // Get local timezone offset in seconds
        let currentTimezoneOffsetInSeconds = Double(TimeZone.current.secondsFromGMT())
        
        // Converts the UTC hour in a Date object
        let utcDate = Date(timeIntervalSince1970: utcTimeInSeconds)

        // Compute the timezone offset in hours
        let offsetInHours = (timezoneInSeconds - currentTimezoneOffsetInSeconds) / 3600

        // Returns local time
        return utcDate.addingTimeInterval(offsetInHours * 3600)

    }
    
    /// Returns the hour String in 24h format.
    func getHourOfTheDay24HFormat() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: self)
        
    }
    
}
