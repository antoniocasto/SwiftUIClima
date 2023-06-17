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

struct RoundedCorner: Shape {
    
    var cornerRadius: Int
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        return Path(path.cgPath)
    }
    
}

extension View {
    
    /// View method which enables ViewLocale modifier on a View to enable Locale selection
    /// injecting an AppLocale.
    func preferredLocale(_ locale: AppLocale) -> some View {
        modifier(ViewLocale(locale: locale))
    }
    
    
    /// This methods rounds selected corner of the View by the specified radius value.
    func cornerRadius(_ radius: Int, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(cornerRadius: radius, corners: corners))
    }
    
}
