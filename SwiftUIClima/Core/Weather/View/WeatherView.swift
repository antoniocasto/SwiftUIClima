//
//  WeatherView.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 06/06/23.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        
        Group {
            
            if viewModel.authStatus == .denied || viewModel.authStatus == .restricted {
                
                ErrorView(title: WeatherView.locationErrorTitle, description: WeatherView.locationErrorDescription, actionDescription: WeatherView.locationActionDescription, systemIcon: "location.slash.fill", action: SystemSettings.openSettings)
                
            } else {
                
                Text("Weather View")
                
            }
            
        }
        
    }
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

extension WeatherView {
    
    static let locationErrorTitle = LocalizedStringKey("WeatherView.locationErrorTitle")
    static let locationErrorDescription = LocalizedStringKey("WeatherView.locationErrorDescription")
    static let locationActionDescription = LocalizedStringKey("WeatherView.locationActionDescription")
    
}
