//
//  CardView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 13/06/23.
//

import SwiftUI

/// Card used to display weather data. It is composed by a title, an SF Symbol and a String value.
struct CardView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
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
            Group {
                if colorScheme == .dark {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundStyle(Color.colorOnDarkGradient)
                } else {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundStyle(Color.colorOnLightGradient)
                }
            }
            
        )

    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Sunrise", systemIcon: "sunrise", value: "06:20")
    }
}
