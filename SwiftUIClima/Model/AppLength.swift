//
//  AppLenght.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 03/07/23.
//

import SwiftUI

/// Enum used to select the app lenght unit measure.
enum AppLength: Int, CaseIterable, Hashable {
    
    case metre
    case miles
    
    // Used for UserDefaults
    static let preferenceKey = "AppLength"
    
    // Length full name
    var lengthName: LocalizedStringKey {
        switch self {
        case .metre:
            return Self.metreLength
        case .miles:
            return Self.milesLength
        }
    }
    
}

extension AppLength {
    static private let metreLength = LocalizedStringKey("AppLenght.metreLength")
    static private let milesLength = LocalizedStringKey("AppLenght.milesLength")
}
