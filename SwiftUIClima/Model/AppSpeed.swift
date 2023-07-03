//
//  AppSpeed.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 03/07/23.
//

import SwiftUI

/// Enum used to select the app speed unit measure.
enum AppSpeed: Int, CaseIterable, Hashable {
    
    case metreSec
    case milesHour
    
    // Used for UserDefaults
    static let preferenceKey = "AppSpeed"
    
    // Speed full name
    var speedName: LocalizedStringKey {
        switch self {
        case .metreSec:
            return Self.metreSecSpeed
        case .milesHour:
            return Self.milesHourSpeed
        }
    }
    
}

extension AppSpeed {
    static private let metreSecSpeed = LocalizedStringKey("AppSpeed.metreSecSpeed")
    static private let milesHourSpeed = LocalizedStringKey("AppSpeed.milesHourSpeed")
}
