//
//  ContentView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        
        VStack {
            
            if let locale = viewModel.locale {
                VStack {
                    Text(locale)
                    Text(ContentView.welcomeMessage)
                }
                .padding()
                .environment(\.locale, .init(identifier: locale))
            } else {
                VStack {
                    Text("No language set")
                    Text(ContentView.welcomeMessage)
                }
                .padding()
            }
            
            HStack {
                Button("EN") {
                    viewModel.setLocale(with: .en)
                }
                
                Button("IT") {
                    viewModel.setLocale(with: .it)
                }
                
                Button("DEFAULT") {
                    viewModel.setLocale(with: .none)
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
