//
//  AppTemperature.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 24/06/23.
//

import SwiftUI

/// Enum used to select the app temperature unit measure.
enum AppTemperature: Int, CaseIterable {
    
    case celsius
    case fahrenheit
    
    // Used for UserDefaults
    static let preferenceKey = "AppTemperature"
    
    // Returns the actual temperature unit
    var unit: UnitTemperature {
        switch self {
        case .celsius:
            return .celsius
        case .fahrenheit:
            return .fahrenheit
        }
    }
    
    // Temperature full name
    var temperatureName: LocalizedStringKey {
        switch self {
        case .celsius:
            return AppTemperature.celsiusTemp
        case .fahrenheit:
            return AppTemperature.fahrenheitTemp
        }
    }
    
}

extension AppTemperature {
    static let celsiusTemp = LocalizedStringKey("AppTemperature.celsiusTemp")
    static let fahrenheitTemp = LocalizedStringKey("AppTemperature.fahrenheitTemp")
}
