//
//  AppTheme.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 06/06/23.
//

import SwiftUI

enum AppTheme: Int, CaseIterable {
    
    case light
    case dark
    case system
    
    static let preferenceKey = "AppTheme"
    
    var theme: ColorScheme? {
        switch self {
        case .system:
            return nil
        case .dark:
            return .dark
        case .light:
            return .light
        }
    }
    
    var themeName: LocalizedStringKey {
        switch self {
        case .system:
            return AppTheme.systemTheme
        case .dark:
            return AppTheme.darkTheme
        case .light:
            return AppTheme.lightTheme
        }
    }
    
}

extension AppTheme {
    
    static let systemTheme = LocalizedStringKey("AppTheme.systemTheme")
    static let darkTheme = LocalizedStringKey("AppTheme.darkTheme")
    static let lightTheme = LocalizedStringKey("AppTheme.lightTheme")
}
