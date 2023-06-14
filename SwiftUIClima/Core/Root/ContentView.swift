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
    
    @AppStorage("SelectedTab") private var selectedTab: Int = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            LocationsView()
                .tabItem {
                    Label(ContentView.locations, systemImage: "heart")
                }
                .tag(0)
            
            WeatherView()
                .tabItem {
                    Label(ContentView.weather, systemImage: "cloud.sun")
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Label(ContentView.settings, systemImage: "gear")
                }
                .tag(2)
            
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
