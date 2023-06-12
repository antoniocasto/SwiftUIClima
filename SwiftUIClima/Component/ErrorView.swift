//
//  ErrorView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 12/06/23.
//

import SwiftUI

enum ErrorType {
    
    case locationNotAvailable
    case connectionNotAvailable
    
    var icon: String {
        switch self {
        case .locationNotAvailable:
            return "location.slash.fill"
        case .connectionNotAvailable:
            return "wifi.slash"
        }
    }
    
}

/// View displaying an error. It accepts a title, a description, an icon and an action function with its description.
struct ErrorView: View {
    
    let title: LocalizedStringKey
    let description: LocalizedStringKey
    let actionDescription: LocalizedStringKey
    let systemIcon: String
    let action: () -> Void
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            Image(systemName: systemIcon)
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(Color.accentColor)
            
            VStack(spacing: 8) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(description)
            }
            .multilineTextAlignment(.center)
            
            Button(actionDescription) {
                action()
            }
            
        }
        .padding(.horizontal)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(title: "Error", description: "Description of the current error.", actionDescription: "Open Settings", systemIcon: "location.slash.fill", action: {})
    }
}
