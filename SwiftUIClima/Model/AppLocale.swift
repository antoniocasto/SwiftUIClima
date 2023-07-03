//
//  AppLocale.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 31/05/23.
//

import SwiftUI

/// Enum used to select the app language.
enum AppLocale: String, CaseIterable, Hashable {
    
    case en = "en"
    case it = "it"
    case system = ""
    
    // Used for UserDefaults
    static let preferenceKey = "AppLocale"
    
    // Full name of the language
    var name: LocalizedStringKey {
        switch self {
        case .en:
            return AppLocale.enLocale
        case .it:
            return AppLocale.itLocale
        case .system:
            return AppLocale.systemLocale
        }
    }
    
}

extension AppLocale {
    
    static let enLocale = LocalizedStringKey("AppLocale.enLocale")
    static let itLocale = LocalizedStringKey("AppLocale.itLocale")
    static let systemLocale = LocalizedStringKey("AppLocale.systemLocale")
    
}
