//
//  ColorExtension.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 13/06/23.
//

import SwiftUI

extension Color {
    
    // Light Mode
    static let lightGradient = LinearGradient(
        gradient: Gradient(colors: [Color(hex: 0x87CEEB), .white]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    // Dark Mode
    static let darkGradient = LinearGradient(
        gradient: Gradient(colors: [Color(hex: 0xFF6700), Color(hex: 0x232323)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    /// Initializer acceptiong an hex number for color and alpha for transparency.
    init(hex: UInt32, alpha: Double = 1.0) {
        
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
        
    }
    
}
