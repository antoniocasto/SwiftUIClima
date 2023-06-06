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
    
    func setLocale(to locale: AppLocale) -> some View {
        modifier(ViewLocale(locale: locale))
    }
    
}
