//
//  SystemSetting.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 09/06/23.
//

import Foundation

/// This is a utility Struct to get system settings.
struct SystemSettings {
    
    /// This function returns the current system locale.
    static func getSystemLocale() -> String {
        
        guard let systemLang = UserDefaults.standard.stringArray(forKey: "AppleLanguages")?.first else {
            fatalError("Error while getting system locale.")
        }
        
        guard let locale = systemLang.split(separator: "-").first else {
            fatalError("Error while getting system locale.")
        }
        
        return String(locale)
        
    }
    
}
