//
//  CardView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 13/06/23.
//

import SwiftUI

/// Card used to display weather data. It is composed by a title, an SF Symbol and a String value.
struct CardView: View {
    
    let title: LocalizedStringKey
    let systemIcon: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            
            VStack {
                Image(systemName: systemIcon)
                Text(title)
            }
            .font(.title3)
            .fontWeight(.semibold)
            
            Text(value)
                .font(.title)
                .fontWeight(.bold)
        }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundStyle(.ultraThinMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.linearGradient(colors: [.clear, .white.opacity(0.3), .white.opacity(0.5), .white.opacity(0.7), .white], startPoint: .bottomTrailing, endPoint: .topLeading), lineWidth: 1)
        )
        .shadow(radius: 8, x: 8, y: 8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Sunrise", systemIcon: "sunrise", value: "06:20")
    }
}
