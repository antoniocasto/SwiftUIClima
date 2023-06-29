//
//  HapitcEngine.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 29/06/23.
//

import UIKit

struct HapticEngine {
    
    static func triggerHaptic() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
}
