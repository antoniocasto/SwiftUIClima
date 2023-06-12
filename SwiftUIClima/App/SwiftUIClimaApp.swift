//
//  SwiftUIClimaApp.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 31/05/23.
//

import SwiftUI

@main
struct SwiftUIClimaApp: App {
    
    // UserDefaults properties for user preferences
    @AppStorage(AppLocale.preferenceKey) private var appLocale: AppLocale = .system
    @AppStorage(AppTheme.preferenceKey) private var appTheme: AppTheme = .system
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredLocale(appLocale)
                .preferredColorScheme(appTheme.theme)
        }
    }
}
