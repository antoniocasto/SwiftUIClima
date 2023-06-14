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
    static func checkDateNight(sunrise: Date, sunset: Date) -> DayNight {
        let date = Date()
        let previousMidnight = Calendar.current.startOfDay(for: date)
        if date >= previousMidnight && date < sunrise ||
            date > sunset {
            
            return .night
        }
        else {
            return .day
        }
    }
    
    /// Returns the hour String in 24h format.
    func getHourOfTheDay24HFormat() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: self)
        
    }
    
}
