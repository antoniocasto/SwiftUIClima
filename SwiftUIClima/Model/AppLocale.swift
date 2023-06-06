//
//  AppLocale.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 31/05/23.
//

import SwiftUI

enum AppLocale: String, CaseIterable {
    
    case en = "en"
    case it = "it"
    case system = ""
    
    static let preferenceKey = "AppLocale"
    
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
