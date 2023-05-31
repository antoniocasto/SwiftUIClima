//
//  ContentView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(AppLocale.preferenceKey) private var appLocale: AppLocale?
    
    var body: some View {
        
        VStack {
            
            VStack {
                Text(appLocale?.rawValue ?? "No Language Set")
                Text(ContentView.welcomeMessage)
            }
            .padding()
            .environment(\.locale, .init(identifier: appLocale?.rawValue ?? ""))
            .padding()
            
            
            HStack {
                Button("EN") {
                    appLocale = .en
                }
                
                Button("IT") {
                    appLocale = .it
                }
                
                Button("DEFAULT") {
                    appLocale = .none
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
