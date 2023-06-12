//
//  LottieView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 12/06/23.
//

import SwiftUI
import Lottie

/// SwiftUI view wrapper for Lottie UIView.
struct LottieView: UIViewRepresentable {
    
    let fileName: String
    let color: UIColor
    
    private let animationView = LottieAnimationView()
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIView(frame: .zero)
        
        // Configure Lottie animation
        animationView.animation = LottieAnimation.named(fileName)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
