//
//  SwiftUIClimaApp.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 31/05/23.
//

import SwiftUI

@main
struct SwiftUIClimaApp: App {
    
    @AppStorage(AppLocale.preferenceKey) private var appLocale: AppLocale = .system
    
    var body: some Scene {
        WindowGroup {
            if appLocale == .system {
                ContentView()
            } else {
                ContentView()
                    .environment(\.locale, .init(identifier: appLocale.rawValue))
            }
        }
    }
}
