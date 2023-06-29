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
struct MessageView: View {
    
    let title: LocalizedStringKey
    let description: LocalizedStringKey
    var actionDescription: LocalizedStringKey? = nil
    let systemIcon: String
    var iconColor: Color = Color.accentColor
    var action: (() -> Void)? = nil
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            Image(systemName: systemIcon)
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(iconColor)
            
            VStack(spacing: 8) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(description)
            }
            .multilineTextAlignment(.center)
            
            if let action = action, let actionDescription = actionDescription {
                Button(actionDescription) {
                    action()
                }
            }
            
        }
        .padding(.horizontal)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(title: "Error", description: "Description of the current error.", actionDescription: "Open Settings", systemIcon: "location.slash.fill")
    }
}
