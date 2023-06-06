//
//  ViewExtension.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 06/06/23.
//

import SwiftUI

struct ViewLocale: ViewModifier {
    
    let locale: AppLocale
    
    func body(content: Content) -> some View {
        
        // Return default locale if .system is selected, otherwise
        // apply .environment(\.locale, ...) to apply selected locale.
        
        Group {
            if locale == .system {
                content
            } else {
                content
                    .environment(\.locale, .init(identifier: locale.rawValue))
            }
        }
    }
    
}

extension View {
    
    /// View method which enables ViewLocale modifier on a View to enable Locale selection
    /// injecting an AppLocale.
    func preferredLocale(_ locale: AppLocale) -> some View {
        modifier(ViewLocale(locale: locale))
    }
    
}
