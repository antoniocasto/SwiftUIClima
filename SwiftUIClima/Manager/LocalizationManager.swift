//
//  LocalizationManager.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 31/05/23.
//

import Foundation

final class LocalizationManager: ObservableObject {
    
    enum Locale: String {
        case en = "en"
        case it = "it"
    }
    
    @Published var locale: Locale?
    
    static let shared = LocalizationManager()
    private let localePreferenceKey = "PreferredLocale"
    
    init() {
        
        // Load saved locale if any
        guard let localePreference = UserDefaults.standard.string(forKey: localePreferenceKey) else { return }
        
        locale = Locale(rawValue: localePreference)
    }
    
    func saveLocalePreference(locale: LocalizationManager.Locale?) {
                
        if let locale = locale {
            UserDefaults.standard.set(locale.rawValue, forKey: localePreferenceKey)
        } else {
            UserDefaults.standard.removeObject(forKey: localePreferenceKey)
        }
        
        self.locale = locale
        
    }
    
}
