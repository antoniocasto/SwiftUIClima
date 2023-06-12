//
//  ContentView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 31/05/23.
//

import SwiftUI

/// This view contains the navigation for the app.
/// The navigation is based on TabView.
struct ContentView: View {
    
    var body: some View {
        
        TabView {
            
            LocationsView()
                .tabItem {
                    Label(ContentView.locations, systemImage: "heart")
                }
            
            WeatherView()
                .tabItem {
                    Label(ContentView.weather, systemImage: "cloud.sun")
                }
            
            SettingsView()
                .tabItem {
                    Label(ContentView.settings, systemImage: "gear")
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
    
    static let locations = LocalizedStringKey("ContentView.locations")
    static let weather = LocalizedStringKey("ContentView.weather")
    static let settings = LocalizedStringKey("ContentView.settings")
}
