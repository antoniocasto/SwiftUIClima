//
//  ContentView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(AppLocale.preferenceKey) private var appLocale: AppLocale = .system
    
    var body: some View {
        
        VStack {
            
            VStack {
                Text(appLocale == .system ? "No Language Set" : appLocale.rawValue)
                Text(ContentView.welcomeMessage)
            }
            .padding()            
            
            HStack {
                Button("EN") {
                    appLocale = .en
                }
                
                Button("IT") {
                    appLocale = .it
                }
                
                Button("DEFAULT") {
                    appLocale = .system
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    static let welcomeMessage = LocalizedStringKey("welcome_message")
}
