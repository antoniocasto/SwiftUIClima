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
    
}
