//
//  AppLenght.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 03/07/23.
//

import SwiftUI

/// Enum used to select the app lenght unit measure.
enum AppLength: Int, CaseIterable, Hashable {
    
    case kilometers
    case miles
    
    // Used for UserDefaults
    static let preferenceKey = "AppLength"
    
    // Length full name
    var lengthName: LocalizedStringKey {
        switch self {
        case .kilometers:
            return Self.kilometersLength
        case .miles:
            return Self.milesLength
        }
    }
    
}

extension AppLength {
    static private let kilometersLength = LocalizedStringKey("AppLenght.kilometersLenght")
    static private let milesLength = LocalizedStringKey("AppLenght.milesLength")
}
